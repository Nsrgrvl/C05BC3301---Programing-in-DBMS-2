DECLARE
    CURSOR dept_cursor(p_dno NUMBER) IS 
        SELECT SName, BasicPay FROM STAFF WHERE Dno = p_dno;
        
    v_dno NUMBER := &Enter_Dept_No;
    v_da NUMBER; v_hra NUMBER; v_pf NUMBER; v_medical NUMBER := 500;
    v_gross NUMBER; v_total_gross NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Details for Department: ' || v_dno);
    FOR rec IN dept_cursor(v_dno) LOOP
        v_hra := 0.15 * rec.BasicPay;
        v_da := 0.50 * rec.BasicPay;
        v_pf := 0.10 * rec.BasicPay;
        v_gross := rec.BasicPay + (v_da + v_hra + v_medical) - v_pf;
        
        v_total_gross := v_total_gross + v_gross;
        DBMS_OUTPUT.PUT_LINE('Name: ' || rec.SName || ' | Basic: ' || rec.BasicPay || ' | Gross: ' || v_gross);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    DBMS_OUTPUT.PUT_LINE('Total Gross Pay for Dept: ' || v_total_gross);
END;
/