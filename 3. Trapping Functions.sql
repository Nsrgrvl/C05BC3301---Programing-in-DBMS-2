DECLARE
    v_name STAFF.SName%TYPE;
BEGIN
    -- Forcing a TOO_MANY_ROWS exception
    SELECT SName INTO v_name FROM STAFF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error Code (SQLCODE): ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('Error Message (SQLERRM): ' || SQLERRM);
END;
/