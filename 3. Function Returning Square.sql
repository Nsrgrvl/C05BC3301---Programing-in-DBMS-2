CREATE OR REPLACE FUNCTION get_square(p_num IN NUMBER) RETURN NUMBER IS
BEGIN
    RETURN p_num * p_num;
END;
/

-- Execution via PL/SQL Block
DECLARE
    v_val NUMBER := 5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Square of ' || v_val || ' is ' || get_square(v_val));
END;
/
-- Execution via Command Line
-- SELECT get_square(5) FROM DUAL;