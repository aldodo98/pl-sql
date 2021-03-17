set SERVEROUTPUT ON

DECLARE

monemp emp%rowtype;
mondept dept%rowtype;

BEGIN

SELECT * INTO monemp FROM emp
where ENAME = 'MILLER';
SELECT * INTO mondept FROM DEPT
where DEPT.DEPTNO = monemp.deptno;


dbms_output.put_line ('enom= '|| monemp.ENAME ||'   salaire= '||monemp.SAL||'  commission= '||monemp.COMM||'nom du departement= '||mondept.DNAME );

END;