DECLARE
    v_amount NUMBER := &Loan_Amount;
    v_rate NUMBER := &Annual_Rate;
    v_years NUMBER := &Number_of_Years;
    v_si NUMBER;
BEGIN
    v_si := (v_amount * v_rate * v_years) / 100;
    DBMS_OUTPUT.PUT_LINE('Loan Amount: ' || v_amount);
    DBMS_OUTPUT.PUT_LINE('Simple Interest: ' || v_si);
END;
/