set serveroutput on;

declare 
monTemp TEMP.CHAR_COL%type;
nm_emp TEMP.NUM_COL2%type;
mon_comm emp.comm%type;

begin
select emp.comm into mon_comm from emp;

SELECT EMP.EMPNO into nm_emp FROM emp
join 
where (EMP.SAL+EMP.COMM)>2000;
dbms_output.put_line('dqsd'||nm_emp);
end;