CREATE OR REPLACE PROCEDURE increase_pay(p_dno IN NUMBER, p_pct IN NUMBER) IS
BEGIN
    UPDATE STAFF 
    SET BasicPay = BasicPay + (BasicPay * (p_pct / 100))
    WHERE Dno = p_dno;
    
    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' staff salaries updated.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No staff found in this department.');
    END IF;
END;
/
-- Execution: EXECUTE increase_pay(10, 5);