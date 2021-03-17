insert into emp values(9999,'test3_7','SALESMAN',9999,to_date('17-12-2020','dd-mm-yyyy'),2200,NULL,68) ;Commit;
update emp set empno=empno-3 where ENAME= 'test3_7';Commit;
delete from emp where ENAME= 'test3_7';Commit;