DECLARE
    v_id STUDENT_MARKS.Stud_ID%TYPE := &Enter_Student_ID;
    v_m1 NUMBER; v_m2 NUMBER; v_m3 NUMBER; v_m4 NUMBER; v_m5 NUMBER;
    v_total NUMBER;
    v_pct NUMBER;
    v_grade VARCHAR2(2);
BEGIN
    SELECT M1, M2, M3, M4, M5 INTO v_m1, v_m2, v_m3, v_m4, v_m5
    FROM STUDENT_MARKS WHERE Stud_ID = v_id;
    
    v_total := v_m1 + v_m2 + v_m3 + v_m4 + v_m5;
    v_pct := (v_total / 500) * 100;
    
    IF v_pct >= 90 THEN v_grade := 'A+';
    ELSIF v_pct >= 80 THEN v_grade := 'A';
    ELSIF v_pct >= 70 THEN v_grade := 'B';
    ELSIF v_pct >= 60 THEN v_grade := 'C';
    ELSIF v_pct >= 50 THEN v_grade := 'D';
    ELSE v_grade := 'F';
    END IF;
    
    UPDATE STUDENT_MARKS 
    SET Total = v_total, Percentage = v_pct, Grade = v_grade 
    WHERE Stud_ID = v_id;
    
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total || ' | Percentage: ' || v_pct || '% | Grade: ' || v_grade);
END;
/