create or replace trigger noweek_zhiao
before delete or update or insert of MGR on emp
for each row
declare
n number:=0;
begin
    if to_char(sysdate, 'FMDAY','NLS_DATE_LANGUAGE=FRENCH') in ('SAMEDI','DIMANCHE') then
        raise_application_error(-20003,'pour  des  raisons  de  sécurité,  on  souhaite interdire  toute  modification  de  la  relation  employé  pendant  le  week-end!');
    end if;
end noweek_zhiao;
/
show err

/*vérifier
update emp set MGR=2 where empno=7000;
*/