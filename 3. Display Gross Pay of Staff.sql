DECLARE
    v_sid STAFF.SID%TYPE := &Enter_Staff_ID;
    v_basic STAFF.BasicPay%TYPE;
    v_da NUMBER;
    v_hra NUMBER;
    v_medical NUMBER := 500;
    v_pf NUMBER;
    v_gross NUMBER;
BEGIN
    SELECT BasicPay INTO v_basic FROM STAFF WHERE SID = v_sid;
    
    v_hra := 0.15 * v_basic;
    v_da := 0.50 * v_basic;
    v_pf := 0.10 * v_basic;
    
    v_gross := v_basic + (v_da + v_hra + v_medical) - v_pf;
    DBMS_OUTPUT.PUT_LINE('Basic Pay: Rs. ' || v_basic);
    DBMS_OUTPUT.PUT_LINE('Gross Pay: Rs. ' || v_gross);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Staff ID not found.');
END;
/