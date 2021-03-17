set SERVEROUTPUT ON

create or replace package package_zhiao as
type empDeDept is record (empnos EMP.EMPNO%type, enames EMP.ENAME%type);
cursor mp_par_dep_zhiao (idDept DEPT.DEPTNO%type) return empDeDept;

procedure raisesalary_zhiao(emp_id in EMP.EMPNO%type, amount in EMP.SAL%type);
procedure afficher_emp_zhiao(idDept in DEPT.DEPTNO%type);

end package_zhiao;
/

create or replace PACKAGE body package_zhiao as
    cursor mp_par_dep_zhiao (idDept DEPT.DEPTNO%type) return 
    empDeDept is select empno,ename from emp where deptno = idDept;
    
    procedure raisesalary_zhiao(emp_id in EMP.EMPNO%type, amount in EMP.SAL%type) as
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
    
    procedure afficher_emp_zhiao(idDept in DEPT.DEPTNO%type) as
    begin
        for n_emp in mp_par_dep_zhiao(idDept) loop
        dbms_output.put_line('numero:'||n_emp.empnos||'name:'||n_emp.enames);
        end loop;
    end afficher_emp_zhiao;
end package_zhiao;
/
/*vérifier 
execute  PACKAGE_ZHIAO.AFFICHER_EMP_ZHIAO(10)
execute  PACKAGE_ZHIAO.RAISESALARY_ZHIAO(7000,600)
execute  PACKAGE_ZHIAO.RAISESALARY_ZHIAO(7900,300)
*/
        