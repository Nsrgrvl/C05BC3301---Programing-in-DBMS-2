DECLARE
    v_num1 NUMBER := 10;
    v_num2 NUMBER := 0;
    v_ans NUMBER;
BEGIN
    v_ans := v_num1 / v_num2;
    DBMS_OUTPUT.PUT_LINE('Answer: ' || v_ans);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Attempted to divide by zero!');
END;
/