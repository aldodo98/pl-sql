set serveroutput on
create or replace procedure createdept_zhiao
(numero_dept in DEPT.DEPTNO%type, dept_name in DEPT.DNAME%type, localisation in DEPT.LOC%type)
is 
mon_deptno DEPT.DEPTNO%type;
begin
    select deptno into mon_deptno from DEPT where DEPTNO = numero_dept;
    if mon_deptno = numero_dept then
        dbms_output.put_line('il exite déjà!');
    end if;
        exception
            when no_data_found then
                insert into dept values(numero_dept,dept_name,localisation);
                commit;

end createdept_zhiao;
/

declare 

numero_dept DEPT.DEPTNO%type:=11;
dept_name DEPT.DNAME%type:= 'dsqd';
localisation DEPT.LOC%type:= 'fqsdqsds';
begin
createdept_zhiao (numero_dept,dept_name,localisation);
end;
