START TRANSACTION;
DROP TABLE IF EXISTS Cliente ;#guarda los datos basicos de cada cliente
CREATE TABLE Cliente (
  cli_id INT NOT NULL AUTO_INCREMENT,
  cli_nombre VARCHAR(45) NOT NULL,
  cli_telefono VARCHAR(20) NOT NULL,
  cli_direccion VARCHAR(50) NOT NULL,
  PRIMARY KEY (cli_id) ,
  UNIQUE INDEX ind_cli_id (cli_id) USING BTREE);

DROP TABLE IF EXISTS Producto ;#guarda lo que vende cada sede (se distingue de "articulo" ya que aerticulo corresponde a lo que vende el proveedor)
CREATE TABLE Producto (
  pro_id INT NOT NULL AUTO_INCREMENT,
  pro_costo INT NOT NULL,
  PRIMARY KEY (pro_id),
  UNIQUE INDEX ind_pro_id (pro_id) USING BTREE);

DROP TABLE IF EXISTS Sede ;#guarda la info de cada sede
CREATE TABLE Sede (
  sed_id INT NOT NULL AUTO_INCREMENT,
  sed_direccion VARCHAR(45) NOT NULL,
  sed_nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (sed_id));

DROP TABLE IF EXISTS Empleado;#guarda la info basica de cada trabajados y en que sede trabaja)
CREATE TABLE Empleado (
  emp_id INT NOT NULL AUTO_INCREMENT,
  emp_nombre VARCHAR(45) NOT NULL,
  emp_apellido VARCHAR(45) NOT NULL,
  emp_direccion VARCHAR(45) NOT NULL,
  emp_telefono varchar(15) NOT NULL,
  emp_salario INT NOT NULL,
  SEDE_sed_id INT NOT NULL,
  PRIMARY KEY (emp_id),
    FOREIGN KEY (SEDE_sed_id)
    REFERENCES Sede (sed_id));

DROP TABLE IF EXISTS Venta;#guarda el total de una venta hecha, cuando se hizo, cuanto costo, a quien se hizo y en que sede
CREATE TABLE Venta(
  ven_id INT NOT NULL AUTO_INCREMENT,
  ven_fecha DATE NOT NULL,
  ven_costo_total INT NOT NULL,
  CLIENTE_cli_id INT NOT NULL,
  SEDE_sed_id INT NOT NULL,
  EMPLEADO_emp_id INT NOT NULL,
  PRIMARY KEY (ven_id),
    FOREIGN KEY (CLIENTE_cli_id)
		REFERENCES Cliente (cli_id),
    FOREIGN KEY (SEDE_sed_id)
		REFERENCES Sede (sed_id),
	FOREIGN KEY (EMPLEADO_emp_id)
		REFERENCES Empleado (emp_id));

DROP TABLE IF EXISTS Proveedor ;#guarda la info de cada proveedor
CREATE TABLE Proveedor(
  prov_id INT NOT NULL auto_increment,
  prov_nombre VARCHAR(45) NOT NULL,
  prov_direccion VARCHAR(45) NOT NULL,
  prov_telefono INT NOT NULL,
  PRIMARY KEY (prov_id),
  UNIQUE INDEX ind_prov_id (prov_id) USING BTREE);

DROP TABLE IF EXISTS Compra;#guarda la info de una compra hecha a un proveedor (cant. total,costo total,fecha, a que sede se dirije y el proveedor)
CREATE TABLE Compra (
  com_id INT NOT NULL AUTO_INCREMENT,
  com_cantidad INT NOT NULL,
  com_costo_total INT NOT NULL,
  com_fecha DATE NOT NULL,
  SEDE_sed_id INT NOT NULL,
  PROVEEDOR_prov_id INT  NOT NULL,
  PRIMARY KEY (com_id,com_fecha),
    FOREIGN KEY (SEDE_sed_id)
		REFERENCES Sede (sed_id),
    FOREIGN KEY (PROVEEDOR_prov_id)
		REFERENCES Proveedor (prov_id));

DROP TABLE IF EXISTS Articulo ;# al articulo que vende cada proveedor(dos proveedores pueden vender la misma presentacion a distintos precios)
CREATE TABLE Articulo(
  art_id INT NOT NULL auto_increment,
  art_nombre VARCHAR(45) NOT NULL,
  art_costo INT NOT NULL,
  PROVEEDOR_prov_id INT NOT NULL,
  PRIMARY KEY (art_id),
    FOREIGN KEY (PROVEEDOR_prov_id)
		REFERENCES Proveedor (prov_id),
  UNIQUE INDEX ind_art_id (art_id) USING BTREE);
###################################################
DROP TABLE IF EXISTS INVENTARIO_SEDE;# la cantidad de una presentacion que tiene cada sede
CREATE TABLE INVENTARIO_SEDE (
  inv_SEDE_id INT NOT NULL,
  inv_PRODUCTO_id INT NOT NULL,
  inv_Cantidad INT NOT NULL,
  PRIMARY KEY (inv_SEDE_id, inv_PRODUCTO_id),
    FOREIGN KEY (inv_SEDE_id)
		REFERENCES Sede (sed_id),
    FOREIGN KEY (inv_PRODUCTO_id)
		REFERENCES Producto (pro_id));
        
DROP TABLE IF EXISTS COMPRA_has_PROVEEDOR ;
CREATE TABLE COMPRA_has_PROVEEDOR (
  COMPRA_com_id INT NOT NULL,
  PROVEEDOR_prov_id INT NOT NULL,
  PRIMARY KEY (COMPRA_com_id, PROVEEDOR_prov_id),
    FOREIGN KEY (COMPRA_com_id)
		REFERENCES Compra (com_id),
    FOREIGN KEY (PROVEEDOR_prov_id)
		REFERENCES Proveedor (prov_id));
##################################################
DROP TABLE IF EXISTS Particular ;#personas naturales que compran de vez en cuando
CREATE TABLE Particular (
  CLIENTE_cli_id INT NOT NULL,
  PRIMARY KEY (CLIENTE_cli_id),
    FOREIGN KEY (CLIENTE_cli_id)
		REFERENCES Cliente (cli_id));

DROP TABLE IF EXISTS Establecimiento;# se guarda el tipo de negocio, su rep. legal y comercial
CREATE TABLE Establecimiento (
  CLIENTE_cli_id INT NOT NULL,
  est_tipo_de_empresa VARCHAR(20) NOT NULL,
  est_pagina_web VARCHAR(50) NULL,
  est_rep_legal VARCHAR(30) NOT NULL,
  est_rep_legal_telefono varchar(15) NOT NULL,
  est_rep_comercial VARCHAR(45) NOT NULL,
  est_rep_comercial_telefono varchar(15) NOT NULL,
  PRIMARY KEY (CLIENTE_cli_id),
    FOREIGN KEY (CLIENTE_cli_id)
		REFERENCES Cliente (cli_id));

#######################################################################
DROP TABLE IF EXISTS DETALLE_COMPRA ;#los articulos y la cantidad que componen una compra
CREATE TABLE DETALLE_COMPRA (
  detc_COMPRA_id INT NOT NULL,
  detc_ARTICULO_id INT NOT NULL,
  detc_cantidad INT NOT NULL,
  PRIMARY KEY (detc_COMPRA_id, detc_ARTICULO_id),
    FOREIGN KEY (detc_COMPRA_id)
		REFERENCES Compra (com_id),
    FOREIGN KEY (detc_ARTICULO_id)
		REFERENCES Articulo (art_id));
#######################################################################
DROP TABLE IF EXISTS DETALLE_VENTA ;#los productos y la cantidad que componen una venta
CREATE TABLE DETALLE_VENTA (
    detv_VENTA_id INT NOT NULL,
    detv_PRODUCTO_id INT NOT NULL,
    detv_cantidad INT NOT NULL,
    PRIMARY KEY (detv_VENTA_id , detv_PRODUCTO_id),
    FOREIGN KEY (detv_VENTA_id)
        REFERENCES venta (ven_id),
    FOREIGN KEY (detv_PRODUCTO_id)
        REFERENCES producto (pro_id)
);

DROP TABLE IF EXISTS Repartidor;#empleado que reparte
CREATE TABLE Repartidor (
  EMPLEADO_emp_id INT NOT NULL,
  PRIMARY KEY (EMPLEADO_emp_id),
    FOREIGN KEY (EMPLEADO_emp_id)
		REFERENCES Empleado (emp_id));

DROP TABLE IF EXISTS Administrador ;#empleado encargado de la sede
CREATE TABLE Administrador (
  EMPLEADO_emp_id INT NOT NULL,
  PRIMARY KEY (EMPLEADO_emp_id),
    FOREIGN KEY (EMPLEADO_emp_id)
		REFERENCES Empleado(emp_id));

DROP TABLE IF EXISTS Ruta;#contiene el costo de l domicilio y el lugar a donde el repartidor debe llevar el pedido
CREATE TABLE Ruta(
  rut_id INT NOT NULL AUTO_INCREMENT,
  rut_costo INT NULL default NULL,
  REPARTIDOR_EMPLEADO_id INT NOT NULL,
  rut_VENTA_id INT NOT NULL,
  rut_entregado BOOLEAN,
  PRIMARY KEY (rut_id),
    FOREIGN KEY (REPARTIDOR_EMPLEADO_id)
		REFERENCES Repartidor (EMPLEADO_emp_id),
    FOREIGN KEY (rut_VENTA_id)
		REFERENCES Venta (ven_id),
        UNIQUE INDEX ind_rut_id (rut_id) USING BTREE);


/*--------------------------INSERCIÓN DE DATOS----------------------------*/


/* Los datos corresponden al archivo "INVENTARIO corte febrero" se han omitido los paquetes defectuosos y las devoluciones.*/

# proveedores

insert into proveedor(prov_nombre,prov_direccion,prov_telefono) values ('cauca','cauca,colombia',1234567);
insert into proveedor(prov_nombre,prov_direccion,prov_telefono) values ('prov2','medellin,colombia',5555);# dato de prueba para el id incremental
#select * from proveedor;
#...................

#Articulos

insert into articulo (art_nombre,art_costo,PROVEEDOR_prov_id) values ('libra',3428, 1);
insert into articulo (art_nombre,art_costo,PROVEEDOR_prov_id) values ('kilo',6556, 1);
insert into articulo (art_nombre,art_costo,PROVEEDOR_prov_id) values ('12.5kilos',75700,1);
insert into articulo (art_nombre,art_costo,PROVEEDOR_prov_id) values ('25 kilos',151400,1);
#select * from articulo;
#...................
 
#sede 

insert into sede (sed_direccion,sed_nombre) values ('Cr 8 # 42A-12 Piso 2(4parques)','bog_principal');
#select * from sede;
#...................

#compra

insert into compra(com_cantidad,com_costo_total,com_fecha,SEDE_sed_id,PROVEEDOR_prov_id) values (19,83900,'2017-02-14',1,1);
insert into compra(com_cantidad,com_costo_total,com_fecha,SEDE_sed_id,PROVEEDOR_prov_id) values (6,39336,'2017-02-16',1,1);
insert into compra(com_cantidad,com_costo_total,com_fecha,SEDE_sed_id,PROVEEDOR_prov_id) values (61,1614700,'2017-02-16',1,1);
insert into compra(com_cantidad,com_costo_total,com_fecha,SEDE_sed_id,PROVEEDOR_prov_id) values (25,85700,'2017-02-21',1,1);

#select * from compra;
#...................

#DETALLE_COMPRA (cada compra desglozada en los articulos que la componen)

insert into DETALLE_COMPRA values (1,1,13);
insert into DETALLE_COMPRA values (1,2,6);
insert into DETALLE_COMPRA values (2,2,6);
insert into DETALLE_COMPRA values (3,2,50);
insert into DETALLE_COMPRA values (3,3,5);
insert into DETALLE_COMPRA values (3,4,6);
insert into DETALLE_COMPRA values (4,1,25);

#select * from DETALLE_COMPRA;
#select sum(articulo.art_costo*detalle_compra.detc_cantidad) as 'costo total de la compra'from articulo join detalle_compra on(articulo.art_id=detalle_compra.detc_ARTICULO_id) group by detalle_compra.detc_COMPRA_id; #comparar con "costo total" en tabla "compra"
#...................

#compra_has_proveedor

insert into compra_has_proveedor values (1,1);
insert into compra_has_proveedor values (2,1);
insert into compra_has_proveedor values (3,1);
insert into compra_has_proveedor values (4,1);
#select * from compra_has_proveedor;
#empleados

insert into empleado (emp_nombre, emp_apellido, emp_direccion, emp_telefono,emp_salario, SEDE_sed_id) values
('Magola','Reyes','cra 15 #46-27','3169547846',700000,1);
insert into empleado (emp_nombre, emp_apellido, emp_direccion, emp_telefono,emp_salario, SEDE_sed_id) values
('Raul','Celis','calle 67 #23a-06','3145689722',500000,1);
insert into empleado (emp_nombre, emp_apellido, emp_direccion, emp_telefono,emp_salario, SEDE_sed_id) values
('Ricardo','Aldana','diag 34 # 24-07','3215258679',500000,1);
#select * from empleado;
#...................

#administrador

insert into administrador values(1);

#select * from administrador;
#...................

#repartidores

insert into repartidor values(2);
insert into repartidor values(3);

#select * from repartidor;
#...................

#productos(esta tabla se crea porque distintas sedes pueden vender distintos productos)

insert into producto (pro_costo) values (6850);
insert into producto (pro_costo) values (13500);
insert into producto (pro_costo) values (162500);
insert into producto (pro_costo) values (312500);

#select * from producto;
#...................

#inventario por sede (cada sede puede tener distintas cantidades de distintos productos)

insert into inventario_sede values(1,1,25);
insert into inventario_sede values(1,2,16);
insert into inventario_sede values(1,3,3);
insert into inventario_sede values(1,4,4);

#select * from inventario_sede;
#...................

#clientes

 insert into cliente (cli_nombre,cli_telefono,cli_direccion) values('La castana','7894522','calle 18 #45-06'),
																 ('Ready to eat','4587892','carrera 23 #12-67'),
																 ('panoptico','9668523','kra 8 #34-48'),
																 ('salvo patria','8752013','trans 4 #12a-09'),
																 ('metkalu','4578920','carrera 4 #25-07'),
																 ('felipe','3124587856','calle 62 #12-27'),
																 ('clorofila','4512020','calle 82 #13-04'),
																 ('naturalmente vegano','8544103','carrera 24 #56-07'),
																 ('esencia pura','8974561','diag 25 #21-08'),
																 ('hippie','7845698','calle 116 # 15-09'),
																 ('the pot','6458791','carrera 24 #52-05'),
																 ('ocio','8756932','calle 98a #34-09'),
																 ('el verdugo','7531598','calle 63 #11-28'),
																 ('zulma','3156987845','kra 1 #34-05');

#select * from cliente;

#establecimientos
insert into establecimiento (CLIENTE_cli_id, est_tipo_de_empresa, est_rep_legal, est_rep_legal_telefono, est_rep_comercial,est_rep_comercial_telefono) values 
(1,'restaurante','ivan lemus','3120255689','david umbarila','3145899636'),
(2,'restaurante','jonatan carrillo','3214567885','daniel organista','3158794561'),
(3,'restaurante','daniela torres','318959862','santiago campo','3154879521'),
(4,'restaurante','daniel angulo','3147895623','nicolas casas','312056936'),
(5,'punto de venta','juan cardenas','3102587894','daniel moreno','320147896'),
(7,'punto de venta','felipe ramirez','3214588963','gabriel rodriguez','350214578'),
(8,'restaurante','sebastian aponte','31658996','raul lesmes','320144523'),
(9,'restaurante','santiago realpe','310114569','jessica guerrero','31223369'),
(10,'restaurante','martin silva','31145589','ana castaneda','32256698'),
(11,'restaurante','luisa tique','3147855','laura martinez','3504785'),
(12,'restaurante','sara gonsalez','32256998','camilo rendon','31115698'),
(13,'restaurante','mateo osorio','32045889','mauricio sanchez','31415526');

#select * from establecimiento;
#...................

#particulares

insert into particular values(6);
insert into particular values(14);

#select * from particular;
#...................

#ventas

insert into venta (ven_fecha, ven_costo_total, CLIENTE_cli_id, SEDE_sed_id,EMPLEADO_emp_id) values ('2017-02-16',68100,1,1,1),
																								('2017-02-16',67500,2,1,1),
																								('2017-02-17',67500,3,1,1),
																								('2017-02-17',135000,4,1,1),
																								('2017-02-17',40500,5,1,1),
																								('2017-02-17',6850,14,1,1),
																								('2017-02-18',33850,6,1,1),
																								('2017-02-20',176100,7,1,1),
																								('2017-02-22',162500,8,1,1),
																								('2017-02-22',312500,2,1,1),
																								('2017-02-22',67500,9,1,1),
																								('2017-02-23',162500,10,1,1),
																								('2017-02-23',312500,11,1,1),
																								('2017-02-28',54000,12,1,1);

#select * from venta;
#...................

#detalle venta (cada venta desglozada en los articulos que la componen)

 insert into detalle_venta values(1,1,6),
								 (1,2,2),
								 (2,2,5),
								 (3,2,5),
								 (4,2,10),
								 (5,2,3),
								 (6,1,1),
								 (7,1,1),
								 (7,2,2),
								 (8,1,6),
								 (8,2,10),
								 (9,3,1),
								 (10,4,1),
								 (11,2,5),
								 (12,3,1),
								 (13,4,1),
								 (14,2,4);

#select * from detalle_venta;
#...................

#ruta

insert into ruta(rut_costo,REPARTIDOR_EMPLEADO_id,rut_VENTA_id,rut_entregado) values(NULL,2,1,1),
																					(NULL,2,2,1),
																					(NULL,2,3,1),
																					(NULL,2,4,1),
																					(NULL,2,5,1),
																					(10000,2,6,1),
																					(NULL,2,7,1),
																					(NULL,2,8,1),
																					(NULL,2,9,1),
																					(NULL,2,10,1),
																					(NULL,2,11,1),
																					(NULL,2,12,1),
																					(NULL,2,13,0),
																					(NULL,3,14,0);

#select * from ruta;