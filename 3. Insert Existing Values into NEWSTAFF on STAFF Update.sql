CREATE OR REPLACE TRIGGER trg_update_newstaff
BEFORE UPDATE ON STAFF
FOR EACH ROW
BEGIN
    INSERT INTO NEWSTAFF (SID, SName, Dno, Dname, Gender, Age, BasicPay)
    VALUES (:OLD.SID, :OLD.SName, :OLD.Dno, :OLD.Dname, :OLD.Gender, :OLD.Age, :OLD.BasicPay);
END;
/