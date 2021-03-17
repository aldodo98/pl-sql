create or replace trigger checksal_zhiao
before update of job on emp
for each row
declare
max_sal salintervalle_f2.hsal%type;
min_sal salintervalle_f2.lsal%type;
begin
select hsal,lsal into max_sal,min_sal from salintervalle_f2 where job = :new.job;
if :old.job != 'PRESIDENT' THEN 
    if salok_zhiao(:new.job, :new.sal+100) =1 then
        :new.sal := :new.sal+100;
    elsif :new.sal <min_sal then
        :new.sal := min_sal;
    elsif :new.sal > max_sal then
        :new.sal := max_sal;
    end if;
end if;
end;
/
/*vérifier*/
update emp set job='ANALYST' where empno=7000;
select * from emp where empno=7000;