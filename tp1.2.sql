DECLARE 
is_pair TEMP.CHAR_COL%type;
BEGIN
    FOR i IN 1..30 LOOP
        IF mod(i,2) = 1 THEN
            is_pair := TO_CHAR(i)||' est impair';
        ELSE
            is_pair := TO_CHAR(i)||' est pair';
        END IF;
        INSERT INTO TEMP VALUES (i,i*100,is_pair);
        
    END LOOP;
COMMIT;
END;
