----------------------------DATOS DUENIO----------------------------
INSERT INTO DUENIOS VALUES ('12345678A', 'Cristian', 'Perez Leon', 'Sevilla');
INSERT INTO DUENIOS VALUES ('23345345B', 'Jose', 'Gonzales Aturriaga', 'Malaga');
INSERT INTO DUENIOS VALUES ('87253782B', 'Daniel', 'Muñoz Baez', 'Barcelona');
INSERT INTO DUENIOS VALUES ('76265390C', 'Eusebio', 'Lopez Garcia', 'Sevilla');
INSERT INTO DUENIOS VALUES ('63728392C', 'Rocio', 'Caballo Hidalgo', 'Madrid');
INSERT INTO DUENIOS VALUES ('98213432A', 'Ana', 'Garcia Gomez', 'Cadiz');



-------------------------------DATOS TIENDA--------------------------------
INSERT INTO TIENDA VALUES ('CPL Reparaciones', '12345678A', 'Sevilla', '02/08/2019');
INSERT INTO TIENDA VALUES ('JMG Electronic', '23345345B', 'Toledo', '01/02/2020');
INSERT INTO TIENDA VALUES ('DMB Reparaciones', '87253782B', 'Sevilla', '04/03/2018');
INSERT INTO TIENDA VALUES ('ELG Reparaciones', '76265390C', 'Barcelona', '06/03/2019');
INSERT INTO TIENDA VALUES ('RCH Electronic', '63728392C', 'Madrid', '01/09/2017');
INSERT INTO TIENDA VALUES ('AGG Reparaciones', '98213432A', 'Bilbao', '12/02/2019');


-------------------------------DATOS DEPARTAMENTOS--------------------------------

INSERT INTO DEPARTAMENTOS VALUES ('12345678', 'CPL Reparaciones', 'Gestion productos', 'Departamento productos CPL');
INSERT INTO DEPARTAMENTOS VALUES ('87654321', 'CPL Reparaciones', 'Gestion empleados', 'Departamento empleados CPL');

INSERT INTO DEPARTAMENTOS VALUES ('36726091', 'JMG Electronic', 'Gestion productos', 'Departamento productos JMG');
INSERT INTO DEPARTAMENTOS VALUES ('09261538', 'JMG Electronic', 'Gestion empleados', 'Departamento empleados JMG');

INSERT INTO DEPARTAMENTOS VALUES ('15384758', 'DMB Reparaciones', 'Gestion productos', 'Departamento productos DMB');
INSERT INTO DEPARTAMENTOS VALUES ('87263519', 'DMB Reparaciones', 'Gestion empleados', 'Departamento empleados DMB');

INSERT INTO DEPARTAMENTOS VALUES ('46372901', 'ELG Reparaciones', 'Gestion productos', 'Departamento productos ELG');
INSERT INTO DEPARTAMENTOS VALUES ('24385938', 'ELG Reparaciones', 'Gestion empleados', 'Departamento empleados ELG');

INSERT INTO DEPARTAMENTOS VALUES ('84854986', 'RCH Electronic', 'Gestion productos', 'Departamento productos RCH');
INSERT INTO DEPARTAMENTOS VALUES ('99524781', 'RCH Electronic', 'Gestion empleados', 'Departamento empleados RCH');

INSERT INTO DEPARTAMENTOS VALUES ('22152452', 'AGG Reparaciones', 'Gestion productos', 'Departamento productos AGG');
INSERT INTO DEPARTAMENTOS VALUES ('62445215', 'AGG Reparaciones', 'Gestion empleados', 'Departamento empleados AGG');







               
-----------------------------DATOS EMPLEADOS-----------------------------


INSERT INTO EMPLEADO VALUES ('00000001', 'Adrian Sanchez Carrion', '12/02/1994', 'CPL Reparaciones','CARGO1','12345678');
INSERT INTO EMPLEADO VALUES ('00000002', 'Pepito Grillo lopez', '02/11/1997', 'CPL Reparaciones','CARGO2','12345678');
INSERT INTO EMPLEADO VALUES ('00000003', 'David Perez Alvarez', '19/04/1991', 'CPL Reparaciones','CARGO3','87654321');

INSERT INTO EMPLEADO VALUES ('00000004', 'Lorena Gomez Minguet', '09/10/1990', 'JMG Electronic','CARGO1','36726091');
INSERT INTO EMPLEADO VALUES ('00000005', 'Claudia Ramirez Lopez', '12/08/1999', 'JMG Electronic','CARGO2','36726091');
INSERT INTO EMPLEADO VALUES ('00000006', 'Raul Blanco Mendez', '02/10/1982', 'JMG Electronic','CARGO3','09261538');

INSERT INTO EMPLEADO VALUES ('00000007', 'Ana Lebron Leon', '02/02/1981', 'DMB Reparaciones','CARGO1','15384758');
INSERT INTO EMPLEADO VALUES ('00000008', 'Francisco Casado Barrera', '14/02/1972', 'DMB Reparaciones','CARGO2','15384758');
INSERT INTO EMPLEADO VALUES ('00000009', 'Benito Barrera Espinar', '01/01/1991', 'DMB Reparaciones','CARGO3','87263519');

INSERT INTO EMPLEADO VALUES ('00000010', 'Alberto Rodriguez Portillo', '12/02/1994', 'ELG Reparaciones','CARGO1','46372901');
INSERT INTO EMPLEADO VALUES ('00000011', 'Teresa Ruiz Carrasco', '12/02/1994', 'ELG Reparaciones','CARGO2','46372901');
INSERT INTO EMPLEADO VALUES ('00000012', 'Marta Minguet Lopez', '03/10/1993', 'ELG Reparaciones','CARGO3','24385938');

INSERT INTO EMPLEADO VALUES ('00000013', 'Jose Talaberon Perez', '11/09/1994', 'RCH Electronic','CARGO1','84854986');
INSERT INTO EMPLEADO VALUES ('00000014', 'Amalia Guerrero Carrion', '12/05/1984', 'RCH Electronic','CARGO2','84854986');
INSERT INTO EMPLEADO VALUES ('00000015', 'Estefania Lopez Lopez', '11/12/1992', 'RCH Electronic','CARGO3','99524781');

INSERT INTO EMPLEADO VALUES ('00000016', 'Belen Puentes Robles', '09/01/1981', 'AGG Reparaciones','CARGO1','22152452');
INSERT INTO EMPLEADO VALUES ('00000017', 'Sofia Peuntes Robles', '12/02/1984', 'AGG Reparaciones','CARGO2','22152452');
INSERT INTO EMPLEADO VALUES ('00000018', 'Alejandro Fuentes Espinar', '11/09/2000', 'AGG Reparaciones','CARGO3','62445215');
