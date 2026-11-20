BEGIN
    UPDATE STAFF 
    SET BasicPay = BasicPay + (BasicPay * 0.10) 
    WHERE Dno = 10;
    
    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' record(s) updated successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No staff members found in department 10.');
    END IF;
END;
/