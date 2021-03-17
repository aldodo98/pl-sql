set SERVEROUTPUT on

declare
cursor drop_table is select table_name from user_tables where TABLE_NAME like '%_old';
cursor create_table is select table_name from user_tables;
mon_table user_tables.table_name%type;
ldd_requete varchar(100);

begin
    open drop_table;
    loop
        fetch drop_table into mon_table;
            exit when (drop_table%notfound);
            mon_table:='"'||mon_table||'"';
        ldd_requete :='drop table '||mon_table;
        dbms_output.put_line(ldd_requete);
        
        execute immediate ldd_requete;
        dbms_output.put_line('vous avez supprimé:'||mon_table);
    end loop;
    dbms_output.put_line('Il y a pas de table se termine par _old maintenant');
    close drop_table;

    open create_table;
    loop 
        fetch create_table into mon_table;
            exit when (create_table%notfound);
        ldd_requete :='create table "'||mon_table||'_old" as select * from '||mon_table;
        dbms_output.put_line(ldd_requete);
        execute immediate ldd_requete;
        dbms_output.put_line('vous avez crée:'||mon_table||'_old');
    end loop;
close create_table;

end;
/
show err;
