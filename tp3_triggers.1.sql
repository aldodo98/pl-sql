create or replace trigger raise_zhiao
before update on emp
for each row
begin
    if :new.sal<:old.sal then
        raise_application_error(-20001,'Le salaire d’un employé ne diminue jamais.');
    end if;
end raise_zhiao;
/
show err

/*vérifier
update emp set sal=2000 where EMPNO=7000;
*/