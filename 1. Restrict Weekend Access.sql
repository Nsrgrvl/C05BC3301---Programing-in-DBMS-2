CREATE OR REPLACE TRIGGER restrict_staff_weekend
BEFORE INSERT OR UPDATE OR DELETE ON STAFF
BEGIN
    IF TO_CHAR(SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Access to the STAFF table is restricted during weekends.');
    END IF;
END;
/