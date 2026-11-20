CREATE OR REPLACE TRIGGER trg_insert_newstaff
AFTER INSERT ON STAFF
FOR EACH ROW
BEGIN
    INSERT INTO NEWSTAFF (SID, SName, Dno, Dname, Gender, Age, BasicPay)
    VALUES (:NEW.SID, :NEW.SName, :NEW.Dno, :NEW.Dname, :NEW.Gender, :NEW.Age, :NEW.BasicPay);
END;
/