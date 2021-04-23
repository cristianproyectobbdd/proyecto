

/*
- Al menos dos funciones que se use desde
el programa principal.
*/


--Funcion 1, dado un id empleado, comprueba si existe dicho empleado
        
 
          CREATE OR REPLACE FUNCTION existe_empleado(id_emp CHAR)
            RETURN BOOLEAN IS
                v_id CHAR(8);
            BEGIN
                SELECT id_empleado INTO v_id FROM empleado WHERE id_emp=id_empleado  ;
                -- Si se ha encontrado un equipo con el mismo nombre que le hemos pasado, devuelve TRUE.
                RETURN TRUE;
            -- Si no se ha encontrado un equipo con el mismo nombre que le hemos pasado, devuelve FALSE.
            EXCEPTION WHEN no_data_found THEN
                RETURN FALSE;
            END;
            / 

            DECLARE 
                v_id_empleado CHAR(8);

            BEGIN
            v_id_empleado:='10000001';
             	if existe_empleado( v_id_empleado)=false then
             	DBMS_OUTPUT.PUT_LINE('Error, no existe empleado con ese código');
             end if;
            END;
            /

--Funcion 2, Lista de empleados a partir de un determinado cargo
CREATE OR REPLACE PROCEDURE mostrar_por_cargo(nombre VARCHAR2)
            IS
            CURSOR cargo IS
                    SELECT DISTINCT e.nombre FROM empleado e WHERE e.cargo='CARGO1';
                    v_cargo VARCHAR2(10);
BEGIN
                OPEN cargo;
                        DBMS_OUTPUT.PUT_LINE('Cargo');
                        LOOP
                         FETCH cargo INTO v_cargo;
                         EXIT WHEN cargo%NOTFOUND;
                         DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_cargo);
                        END LOOP;
                CLOSE cargo;
 END;
 /



/*
- Al menos dos procedimientos que se use
desde el programa principal.
*/

--procedimietno 1, crea un nuevo empleado y lo inserta en la tabla empleado
CREATE OR REPLACE PROCEDURE crear_nuevo_empleado(id_emp char, nom_emp varchar2, fecha date, tienda_emp VARCHAR2, cargo_emp varchar2, departamento char)
AS

BEGIN
    IF existe_empleado(id_emp) = TRUE THEN
        DBMS_OUTPUT.PUT_LINE('Error: el id ya existe.');
        RETURN;
    END IF;
   
    
    INSERT INTO empleado VALUES(id_emp,nom_emp,fecha,tienda_emp,cargo_emp,departamento);
    
    DBMS_OUTPUT.PUT_LINE('Empleado creado con exito');
END;
/


/*
- Al menos dos disparadores, uno de
instrucción y otro de fila.
*/

--DISPARADOR DE INSTRUCCION
--TRIGER DE INSTRUCCION
CREATE OR REPLACE TRIGGER LIMITACION_HORAS_DUENIOS
    BEFORE INSERT ON DUENIOS
    BEGIN
        IF (TO_CHAR(SYSDATE,'HH24') IN ('15','16')) THEN
            DBMS_OUTPUT.PUT_LINE('No se puede insertar datos entre las 15:00 y las 16:00');
    END IF;
END;
/


--DISPARADOR PARA LA TABLA DE AUDITORIA DE DUEÑOS
CREATE OR REPLACE TRIGGER t_audit_duenio
    AFTER INSERT OR DELETE OR UPDATE ON DUENIOS
    FOR EACH ROW
    ENABLE
    DECLARE
        v_old VARCHAR2(500);
        v_new VARCHAR2(500);
        v_opc NUMBER(1);
    BEGIN                
        CASE
        WHEN INSERTING THEN
            v_opc:=1;
            v_old:=NULL;
            v_new:=(:NEW.DNI||'*'||:NEW.NOMBRE||'*'||:NEW.APELLIDOS||'*'||:NEW.CIUDAD);
                
        WHEN UPDATING THEN
            v_opc:=2;
             v_new:=(:OLD.DNI||'*'||:OLD.NOMBRE||'*'||:OLD.APELLIDOS||'*'||:OLD.CIUDAD);
             v_new:=(:NEW.DNI||'*'||:NEW.NOMBRE||'*'||:NEW.APELLIDOS||'*'||:NEW.CIUDAD);
                
        WHEN DELETING THEN
            v_opc:=3;
            v_new:=NULL;
            v_new:=(:OLD.DNI||'*'||:OLD.NOMBRE||'*'||:OLD.APELLIDOS||'*'||:OLD.CIUDAD);

        END CASE;
        INSERT INTO audit_duenio VALUES (USER, SYSTIMESTAMP, v_opc, v_old, v_new);
        
        EXCEPTION
        WHEN OTHERS THEN
                dbms_output.put_line('error: '||sqlerrm);
END t_audit_duenio;
/

--DISPARADOR PARA LA TABLA DE AUDITORIA DE TIENDA
CREATE OR REPLACE TRIGGER t_audit_tienda
    AFTER INSERT OR DELETE OR UPDATE ON TIENDA
    FOR EACH ROW
    ENABLE
    DECLARE
        v_old VARCHAR2(500);
        v_new VARCHAR2(500);
        v_opc NUMBER(1);
    BEGIN                
        CASE
        WHEN INSERTING THEN
            v_opc:=1;
            v_old:=NULL;
            v_new:=(:NEW.NOMBRE||'*'||:NEW.DUENIO||'*'||:NEW.CIUDAD||'*'||:NEW.FECHA_APERTURA);
                
        WHEN UPDATING THEN
            v_opc:=2;
             v_new:=(:OLD.NOMBRE||'*'||:OLD.DUENIO||'*'||:OLD.CIUDAD||'*'||:OLD.FECHA_APERTURA);
             v_new:=(:NEW.NOMBRE||'*'||:NEW.DUENIO||'*'||:NEW.CIUDAD||'*'||:NEW.FECHA_APERTURA);
                
        WHEN DELETING THEN
            v_opc:=3;
            v_new:=NULL;
            v_new:=(:OLD.NOMBRE||'*'||:OLD.DUENIO||'*'||:OLD.CIUDAD||'*'||:OLD.FECHA_APERTURA);

        END CASE;
        INSERT INTO audit_tienda VALUES (USER, SYSTIMESTAMP, v_opc, v_old, v_new);
        
        EXCEPTION
        WHEN OTHERS THEN
                dbms_output.put_line('error: '||sqlerrm);
END t_audit_tienda;
/

--DISPARADOR PARA LA TABLA DE AUDITORIA DE DEPARTAMENTOS
CREATE OR REPLACE TRIGGER t_audit_departamentos
    AFTER INSERT OR DELETE OR UPDATE ON DEPARTAMENTOS
    FOR EACH ROW
    ENABLE
    DECLARE
        v_old VARCHAR2(500);
        v_new VARCHAR2(500);
        v_opc NUMBER(1);
    BEGIN                
        CASE
        WHEN INSERTING THEN
            v_opc:=1;
            v_old:=NULL;
            v_new:=(:NEW.COD_DEPARTAMENTO||'*'||:NEW.NOMBRE_TIENDA||'*'||:NEW.DESEMPENIO||'*'||:NEW.NOMBRE_DEP);
                
        WHEN UPDATING THEN
            v_opc:=2;
             v_new:=(:OLD.COD_DEPARTAMENTO||'*'||:OLD.NOMBRE_TIENDA||'*'||:OLD.DESEMPENIO||'*'||:OLD.NOMBRE_DEP);
             v_new:=(:NEW.COD_DEPARTAMENTO||'*'||:NEW.NOMBRE_TIENDA||'*'||:NEW.DESEMPENIO||'*'||:NEW.NOMBRE_DEP);
                
        WHEN DELETING THEN
            v_opc:=3;
            v_new:=NULL;
            v_new:=(:OLD.COD_DEPARTAMENTO||'*'||:OLD.NOMBRE_TIENDA||'*'||:OLD.DESEMPENIO||'*'||:OLD.NOMBRE_DEP);

        END CASE;
        INSERT INTO AUDIT_DEPARTAMENTOS  VALUES (USER, SYSTIMESTAMP, v_opc, v_old, v_new);
        
        EXCEPTION
        WHEN OTHERS THEN
                dbms_output.put_line('error: '||sqlerrm);
END t_audit_departamentos;
/


--DISPARADOR PARA LA TABLA DE AUDITORIA DE EMPLEADO
CREATE OR REPLACE TRIGGER t_audit_empleado
    AFTER INSERT OR DELETE OR UPDATE ON EMPLEADO
    FOR EACH ROW
    ENABLE
    DECLARE
        v_old VARCHAR2(500);
        v_new VARCHAR2(500);
        v_opc NUMBER(1);
    BEGIN                
        CASE
        WHEN INSERTING THEN
            v_opc:=1;
            v_old:=NULL;
            v_new:=(:NEW.ID_EMPLEADO||'*'||:NEW.NOMBRE||'*'||:NEW.FECHANAC||'*'||:NEW.TIENDA||'*'||:NEW.CARGO||'*'||:NEW.DEPARTAMENTO);
                
        WHEN UPDATING THEN
            v_opc:=2;
             v_new:=(:OLD.ID_EMPLEADO||'*'||:OLD.NOMBRE||'*'||:OLD.FECHANAC||'*'||:OLD.TIENDA||'*'||:OLD.CARGO||'*'||:OLD.DEPARTAMENTO);
             v_new:=(:NEW.ID_EMPLEADO||'*'||:NEW.NOMBRE||'*'||:NEW.FECHANAC||'*'||:NEW.TIENDA||'*'||:NEW.CARGO||'*'||:NEW.DEPARTAMENTO);
                
        WHEN DELETING THEN
            v_opc:=3;
            v_new:=NULL;
            v_new:=(:OLD.ID_EMPLEADO||'*'||:OLD.NOMBRE||'*'||:OLD.FECHANAC||'*'||:OLD.TIENDA||'*'||:OLD.CARGO||'*'||:OLD.DEPARTAMENTO);

        END CASE;
        INSERT INTO AUDIT_EMPLEADO  VALUES (USER, SYSTIMESTAMP, v_opc, v_old, v_new);
        
        EXCEPTION
        WHEN OTHERS THEN
                dbms_output.put_line('error: '||sqlerrm);
END t_audit_empleado;
/