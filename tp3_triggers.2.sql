set SERVEROUTPUT on
create or replace trigger numdept_zhiao
before update or insert of deptno on emp
for each row
begin
    if :new.deptno<61 or :new.deptno>69 then
        raise_application_error(-20002,'Le  numéro de département doit être entre 61 -69.');
    end if;
end numdept_zhiao;
/
show err

/*vérifier
UPDATE EMP set deptno = 60 where EMPNO=7000;
*/