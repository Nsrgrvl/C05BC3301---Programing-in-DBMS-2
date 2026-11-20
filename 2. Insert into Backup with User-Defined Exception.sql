DECLARE
    v_dno STAFF.Dno%TYPE := &Enter_Dept_No;
    v_count NUMBER := 0;
    DEPT_NOT_AVAILABLE EXCEPTION;
    
    CURSOR staff_cur IS SELECT * FROM STAFF WHERE Dno = v_dno;
BEGIN
    FOR rec IN staff_cur LOOP
        INSERT INTO STAFF_BACKUP VALUES (rec.SID, rec.SName, rec.Dno, rec.Dname, rec.Gender, rec.Age, rec.BasicPay);
        v_count := v_count + 1;
    END LOOP;
    
    IF v_count = 0 THEN
        RAISE DEPT_NOT_AVAILABLE;
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_count || ' record(s) inserted into backup successfully.');
    END IF;
EXCEPTION
    WHEN DEPT_NOT_AVAILABLE THEN
        DBMS_OUTPUT.PUT_LINE('Exception Raised: DEPT_NOT_AVAILABLE - No records found for entered DNO.');
END;
/