set serveroutput on
create or replace procedure raisesalary_zhiao
(emp_id in EMP.EMPNO%type, amount in EMP.SAL%type)
is 
mon_job EMP.JOB%type;
mon_sal EMP.SAL%type;
mon_lsal SalIntervalle_F2.lsal%type;
mon_hsal SalIntervalle_F2.hsal%type;
nouveau_salaire number;
begin
    select job,sal into mon_job,mon_sal from emp where EMPNO = emp_id;
    select lsal,hsal into mon_lsal,mon_hsal from SALINTERVALLE_F2 where JOB=mon_job;
    nouveau_salaire :=salok_zhiao(mon_job,mon_sal+amount);
    if nouveau_salaire=1 then
        update EMP set sal=sal+amount where EMPNO=emp_id;
        dbms_output.put_line('La changement est enregistré!');
        commit;
    else 
        dbms_output.put_line('échec!');
    end if;
        exception
            when no_data_found then
                dbms_output.put_line('emp_id est faute!');
                commit;
                
end raisesalary_zhiao;
/
/*
declare 

emp_id  EMP.EMPNO%type:=7369;
amount  EMP.SAL%type:=300;
begin
raisesalary_zhiao (emp_id,amount);
end;
*/