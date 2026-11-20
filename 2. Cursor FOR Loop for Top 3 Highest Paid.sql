DECLARE
    CURSOR top_staff IS 
        SELECT SName, BasicPay FROM STAFF ORDER BY BasicPay DESC;
    v_count NUMBER := 0;
BEGIN
    FOR rec IN top_staff LOOP
        v_count := v_count + 1;
        DBMS_OUTPUT.PUT_LINE('Name: ' || rec.SName || ' | Basic Pay: ' || rec.BasicPay);
        EXIT WHEN v_count = 3;
    END LOOP;
END;
/