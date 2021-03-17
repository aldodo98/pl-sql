set serveroutput on
create or REPLACE FUNCTION salok_zhiao
(metier in EMP.job%type, salaire in EMP.SAL%type)
RETURN number
is 
numero NUMBER;
mon_lsal SalIntervalle_F2.lsal%type;
mon_hsal SalIntervalle_F2.hsal%type;

begin

    select lsal,hsal into mon_lsal,mon_hsal from SALINTERVALLE_F2 where job like metier;
    if salaire <= mon_hsal and salaire>=mon_lsal then
        numero := 1;
    else 
        numero := 0;
        
    end if;
    return numero;
    exception
        when no_data_found then
            dbms_output.put_line('metier est faute!');


end salok_zhiao;
/
/*
declare 
nouveau_salaire number;
begin
nouveau_salaire :=salok_zhiao('ANALYST',2000);
dbms_output.put_line(nouveau_salaire);
end;*/