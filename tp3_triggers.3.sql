create or replace trigger dept_zhiao
before update or insert on emp
for each row
declare
n number:=0;
begin
    select count(deptno) into n from dept where deptno= :new.deptno;
    if n=0 then
        insert into dept values (:new.deptno, 'A SAISIR','A SAISIR');
    end if;
end dept_zhiao;
/
show err

/*vérifier
insert into emp values(7001,'zhiao01','SALESMAN',7566,to_date('17-12-1980','dd-mm-yyyy'),2200,NULL,61) ;
*/