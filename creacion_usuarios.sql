drop user if exists 'raul'@'localhost';
create user 'raul'@'localhost' identified by '1234';
revoke all on *.* from 'raul'@'localhost';
grant select on db_1.vw_rutarepartidor to 'raul'@'localhost';

drop user if exists 'cliente'@'localhost';
create user 'cliente'@'localhost' identified by '1234';
revoke all on *.* from 'cliente'@'localhost';
grant select on db_1.vw_inventariocl to 'cliente'@'localhost';

drop user if exists 'admon'@'localhost';
create user 'admon'@'localhost' identified by '1234';
revoke all on *.* from 'admon'@'localhost';
grant select on db_1.vw_clientes to 'admon'@'localhost';
grant select on db_1.vw_rutarepartidor to 'admon'@'localhost';
grant select on db_1.vw_ventas_admin to 'admon'@'localhost';
grant select on db_1.vw_inventariocl to 'admon'@'localhost';
