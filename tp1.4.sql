set serveroutput on;

declare 
monTemp TEMP.CHAR_COL%type;
new_empno EMP.EMPNO%type;
new_comm emp.comm%type;
monTemp1 TEMP.CHAR_COL%type;

cursor c_emp is SELECT empno FROM emp where (sal+nvl(comm,0))>2000;
 
begin
    dbms_output.put_line('les employés dont les revenus mensuels sont supérieurs à $2000: ');
    open c_emp;
    
    loop
        fetch c_emp into new_empno;
        exit when (c_emp%notfound);
        begin
        select char_col into monTemp1 from temp where num_col2=new_empno;
        dbms_output.put_line(monTemp1);
        exception
            when no_data_found then
            dbms_output.put('');
        end;
        
    end loop;

    
    close c_emp;

end;

