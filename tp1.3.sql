DECLARE 
monTemp TEMP%rowtype;
BEGIN


INSERT INTO TEMP SELECT * FROM( SELECT sal,empno,ename  FROM emp
order by emp.SAL desc)
WHERE rownum <= 5;

COMMIT;
END;

/