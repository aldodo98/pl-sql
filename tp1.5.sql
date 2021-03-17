declare 

begin

insert into temp(NUM_COL1,CHAR_COL) select sal,ename from (
    select ename,sal from emp
    connect by prior MGR = empno
    start with empno=7902)
    where sal>=4000 and rownum<=1;
    
end;

