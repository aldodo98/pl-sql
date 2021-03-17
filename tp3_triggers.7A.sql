create or replace trigger record_zhiao
before delete or update or insert on emp
/*for each row*/

begin
    if inserting then
        update STATS_zhiao set NbMaj=NbMaj+1, Date_derniere_Maj=sysdate where TypeMaj= 'INSERT';
    elsif updating then
        update STATS_zhiao set NbMaj=NbMaj+1, Date_derniere_Maj=sysdate where TypeMaj= 'UPDATE';
    elsif deleting then
        update STATS_zhiao set NbMaj=NbMaj+1, Date_derniere_Maj=sysdate where TypeMaj= 'DELETE';
    end if;
end record_zhiao;
/
show err
