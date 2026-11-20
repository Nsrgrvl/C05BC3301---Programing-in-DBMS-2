CREATE OR REPLACE PROCEDURE search_staff(p_sid IN NUMBER, p_sname OUT VARCHAR2) IS
BEGIN
    SELECT SName INTO p_sname FROM STAFF WHERE SID = p_sid;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_sname := 'NOT_FOUND';
END;
/

-- PL/SQL Block to call SEARCH_STAFF
DECLARE
    v_sid NUMBER := &Enter_Staff_ID;
    v_name VARCHAR2(50);
BEGIN
    search_staff(v_sid, v_name);
    
    IF v_name = 'NOT_FOUND' THEN
        DBMS_OUTPUT.PUT_LINE('Error: No staff member found with ID ' || v_sid);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Staff Found. Name: ' || v_name);
    END IF;
END;
/