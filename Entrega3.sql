#########################################################################################################
-- VISTAS
DROP VIEW IF EXISTS vw_rutarepartidor;
CREATE VIEW vw_rutarepartidor AS
    SELECT 
        CURDATE() AS FECHA, emp_nombre AS REPARTIDOR, rut_id AS RUTA
    FROM
        Ruta
            JOIN
        Empleado ON (REPARTIDOR_EMPLEADO_id = emp_id)
            JOIN
        Venta ON (rut_VENTA_id = ven_id)
    WHERE
        ven_fecha = CURDATE()
    ORDER BY REPARTIDOR;

DROP VIEW IF EXISTS vw_inventariocl;
CREATE VIEW vw_inventariocl AS
    SELECT 
        art_id AS ID,
        art_nombre AS PRODUCTO,
        inv_Cantidad AS CANTIDAD
    FROM
        INVENTARIO_SEDE
            JOIN
        Articulo ON (inv_PRODUCTO_id = art_id);

#########################################################################################################
-- PROCEDIMIENTOS

DROP PROCEDURE IF EXISTS sp_compracl;
DELIMITER **
create procedure sp_compracl(IN cli_id INT, IN sed_id INT,IN ven_id INT, In emp_id INT)
	begin
		insert into venta values (ven_id ,CURDATE(),FUN_detalle_venta(ven_id) , cli_id, sed_id, emp_id);
    end ;
**
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_crearuta;
DELIMITER ;)
create procedure sp_crearuta(IN venta_id INT, IN costo_total INT,IN emple_id INT)
	BEGIN
		DECLARE last_entry INT;
		DECLARE costo INT;
        SELECT MAX(rut_id) into last_entry FROM ruta;
		IF costo_total < 50000 THEN
			SET costo = 10000;
		ELSE 
			SET costo = 0;
        END IF;
        insert into ruta value (last_entry+1,costo, emple_id,venta_id,0); 
    END ;)
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_cambiar_repartidor;
DELIMITER ;)
create procedure sp_cambiar_repartidor(IN emp_id INT, IN rut_id INT)
	BEGIN
		DECLARE antiguo_repartidor INT;
        DECLARE nombre_antiguo VARCHAR(40);
        DECLARE apellido_antiguo VARCHAR(40);
        DECLARE nombre_nuevo VARCHAR(40);
        DECLARE apellido_nuevo VARCHAR(40);
        
        SELECT ruta.REPARTIDOR_EMPLEADO_id INTO antiguo_repartidor FROM ruta where ruta.rut_id = rut_id;
        SELECT emp_nombre into nombre_antiguo FROM empleado where empleado.emp_id = antiguo_repartidor;
        SELECT emp_apellido into apellido_antiguo FROM empleado where empleado.emp_id = antiguo_repartidor;

        SELECT emp_nombre into nombre_nuevo FROM empleado where empleado.emp_id = emp_id;
        SELECT emp_apellido into apellido_nuevo FROM empleado where empleado.emp_id = emp_id;

		UPDATE ruta SET ruta.REPARTIDOR_EMPLEADO_id = emp_id WHERE ruta.rut_id=rut_id;
        SET @mensaje = CONCAT('Se cambió al repartidor: ',apellido_antiguo,' ', nombre_antiguo, ' por ', apellido_nuevo, ' ', nombre_nuevo);
        SELECT @mensaje as 'CAMBIO DE REPARTIDOR';
    END ;)
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_comprapr;
DELIMITER ** 
create procedure sp_comprapr(IN sed_id INT, IN pro_id INT, in com_id int)
	BEGIN 
		INSERT into compra(com_costo_total,com_fecha,SEDE_sed_id,PROVEEDOR_prov_id)
			Values (FUN_detalle_compra(com_id), CURDATE(),sed_id,pro_id );
    END;
**
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_registrocl;
DELIMITER ** 
create procedure sp_registrocl(IN cli_nombre VARCHAR(45), IN cli_telefono VARCHAR(20), IN cli_direccion VARCHAR(50))
	BEGIN
		insert into cliente (cli_nombre,cli_telefono ,cli_direccion)
			values (cli_nombre, cli_telefono, cli_direccion);
    END ;
**
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_rutaventa;
DELIMITER ;)
create procedure sp_rutaventa(IN ruta_id INT)
	BEGIN
		UPDATE ruta SET rut_entregado = 1 WHERE ruta_id = rut_id;
    END ;)
DELIMITER ;

#########################################################################################################
-- FUNCIONES

DROP FUNCTION IF EXISTS FUN_detalle_compra;
DELIMITER **
create function FUN_detalle_compra(compra_id int) returns INT
BEGIN 
	declare suma INT;
    SELECT SUM(art_costo) into suma from detalle_compra JOIN articulo ON (detc_ARTICULO_id = art_id) WHERE detc_COMPRA_id = compra_id;
	IF suma IS NOT NULL THEN
		RETURN suma;
    ELSE
		RETURN 0;
    END IF;
END	;
**
DELIMITER ;

DROP FUNCTION IF EXISTS FUN_detalle_venta;
DELIMITER **
create function FUN_detalle_venta(venta_id int) returns INT
BEGIN 
	DECLARE suma INT;
    SELECT SUM(pro_costo) into suma from detalle_venta JOIN producto ON (detv_PRODUCTO_id = pro_id) WHERE detv_VENTA_id = venta_id;
    IF suma IS NOT NULL THEN
		RETURN suma;
    ELSE
		RETURN 0;
    END IF;
    
END	;
**
DELIMITER ;

DROP FUNCTION IF EXISTS FUN_entregado;
DELIMITER ;)
CREATE FUNCTION FUN_entregado(venta_id INT) RETURNS BOOLEAN
BEGIN
	DECLARE entregado INT;
	SELECT rut_entregado INTO entregado FROM ruta WHERE rut_VENTA_id = venta_id;
    RETURN entregado;
END ;)
DELIMITER ;

DROP FUNCTION IF EXISTS FUN_bool_cliente_inscrito;
delimiter $$
create function FUN_bool_cliente_inscrito(cliente varchar(45)) returns bool
begin

declare existe bool default 0;
declare nombre varchar(45);
declare var_i int;
declare var_j int;

declare cur_busqueda cursor for select cli_nombre from cliente;
select count(cli_nombre) into var_i from cliente;
set var_j = 0;

open cur_busqueda;

repeat
	fetch cur_busqueda into nombre;
    if nombre = cliente then
		set existe = 1;
	end if;
    set var_j = var_j+1;
until var_j = var_i 
end repeat;
close cur_busqueda;
return existe;
end $$
delimiter ;

#########################################################################################################
-- TRIGGERS

drop trigger if exists tg_detc_valor_proxcant;
delimiter $$
create trigger tg_detc_valor_proxcant after insert on detalle_compra
for each row begin
declare pro_id int;
declare pro_cant int;
declare pro_costo int;

set pro_id = new.detc_ARTICULO_id;
set pro_cant = new.detc_cantidad;

select articulo.art_costo into pro_costo from ARTICULO where art_id = new.detc_ARTICULO_id;

update compra set com_costo_total = com_costo_total + (pro_costo * pro_cant)/*, com_cantidad = com_cantidad + pro_cant*/ where com_id = new.detc_compra_id;

end $$
delimiter ;

drop trigger if exists tg_detv_valor_proxcant;
delimiter $$
create trigger tg_detv_valor_proxcant after insert on detalle_venta
for each row begin
declare pro_id int;
declare pro_cant int;
declare precio int;

set pro_id = new.detv_PRODUCTO_id;
set pro_cant = new.detv_cantidad;
select pro_costo into precio from producto where producto.pro_id = new.detv_PRODUCTO_id;

update venta set ven_costo_total = ven_costo_total + (precio * pro_cant) where ven_id = new.detv_VENTA_id;
end $$
delimiter ; 

DROP TRIGGER IF EXISTS tg_ruta;
DELIMITER ;)
CREATE TRIGGER tg_ruta AFTER INSERT ON venta
FOR EACH ROW BEGIN
	CALL sp_crearuta(NEW.ven_id, NEW.ven_costo_total, 2);-- Repartidor predeterminado.
END ;)
DELIMITER ;


DROP TRIGGER IF EXISTS tg_inventariocl;
DELIMITER ;)
CREATE TRIGGER tg_inventariocl AFTER INSERT ON detalle_venta
FOR EACH ROW BEGIN
	DECLARE producto INT;
    DECLARE cantidad INT;
    DECLARE existencia INT;
    SET cantidad = NEW.detv_cantidad;
    SET producto = NEW.detv_PRODUCTO_id;
    SELECT inv_cantidad INTO existencia FROM inventario_sede WHERE inv_PRODUCTO_id = producto;
    
    IF cantidad <= existencia THEN 
		UPDATE inventario_sede SET inv_cantidad = inv_cantidad - cantidad WHERE producto = inv_PRODUCTO_id;
    END IF;
END ;)
DELIMITER ;

DROP TRIGGER IF EXISTS tg_inventariopr;
DELIMITER ;)
CREATE TRIGGER tg_inventariopr AFTER INSERT ON detalle_compra
FOR EACH ROW BEGIN
	DECLARE producto INT;
    DECLARE cantidad INT;
    DECLARE existencia INT;
    
    SET cantidad = NEW.detc_cantidad;
    SET producto = NEW.detc_ARTICULO_id;
    SELECT inv_cantidad INTO existencia FROM inventario_sede WHERE inv_PRODUCTO_id = producto;
    
	UPDATE inventario_sede SET inv_cantidad = inv_cantidad + cantidad WHERE producto = inv_PRODUCTO_id;

END ;)
DELIMITER ;

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
-- EJEMPLOS PARA CORRER ---------------------------------------------------------------------------------

-- vw_rutarepartidor
SELECT * FROM vw_rutarepartidor;

-- vw_inventariocl
SELECT * FROM vw_inventariocl;

-- sp_compracl
START TRANSACTION ;
CALL sp_compracl(1,1,99,1);
SELECT * FROM venta;
ROLLBACK;

-- sp_crearuta()
START TRANSACTION;
SELECT * FROM ruta;
CALL sp_crearuta(14,100,2); -- Para este ejemplo se utiliza una venta que ya se ha hecho, y que ya tiene una ruta asignada.
SELECT * FROM ruta;
ROLLBACK;

-- sp_cambiar_repartidor()
START TRANSACTION;
SELECT * FROM ruta WHERE rut_id = 14;
CALL sp_cambiar_repartidor(2,14);
SELECT * FROM ruta WHERE rut_id = 14;
ROLLBACK;

-- sp_comprapr
START TRANSACTION ;
CALL sp_comprapr(1, 1, 99);
SELECT * FROM compra;
ROLLBACK;

-- sp_registrocl
START TRANSACTION ;
CALL sp_registrocl('Juan', '1231231234', 'cll 56 99 99');
SELECT * FROM cliente;
ROLLBACK;

-- sp_rutaventa()
START TRANSACTION;
SELECT * FROM ruta WHERE rut_id = 14;
CALL sp_rutaventa(14);
SELECT * FROM ruta WHERE rut_id = 14;
ROLLBACK;

-- FUN_entregado()
START TRANSACTION;
SELECT * FROM ruta WHERE rut_id = 14;
SELECT FUN_entregado(14);
SELECT * FROM ruta WHERE rut_id = 14;
ROLLBACK;

-- tg_ruta
START TRANSACTION;
SET @id_venta = 100;
SELECT * FROM ruta;
INSERT INTO venta values(@id_venta,curdate(),10000,14,1,1);
SELECT * FROM ruta where rut_VENTA_id = @id_venta;
ROLLBACK;

-- tg_inventariocl
START TRANSACTION;
SET @id_venta = 100;
INSERT INTO venta values(@id_venta,curdate(),10000,14,1,1);-- se crea auxiliarmente una venta para evitar errores de FK.

SET @id_producto = 1;
SELECT * FROM inventario_sede WHERE inv_PRODUCTO_id = @id_producto;

INSERT INTO detalle_venta values (@id_venta,@id_producto,10);

SELECT * FROM inventario_sede WHERE inv_PRODUCTO_id = @id_producto;
ROLLBACK;

-- tg_inventariopr
START TRANSACTION;
SET @id_compra = 102;
INSERT INTO compra values(@id_compra,100000,curdate(),1,1);-- se crea auxiliarmente una venta para evitar errores de FK.

SET @id_articulo = 1;
SELECT * FROM inventario_sede WHERE inv_PRODUCTO_id = @id_articulo;

SET @CANTIDAD = 15;
INSERT INTO detalle_compra values (@id_compra,@id_articulo,@CANTIDAD);-- Lo que detona el trigger.

SELECT * FROM inventario_sede WHERE inv_PRODUCTO_id = @id_producto;
ROLLBACK;