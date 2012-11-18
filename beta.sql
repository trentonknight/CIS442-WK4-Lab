/*main branch to beta file for procedure*/
CREATE OR REPLACE PROCEDURE newMESSAGES 
IS
BEGIN
  DELETE FROM MESSAGES;
  DECLARE
  v_DepID varchar2(150);
  v_Major varchar2(150);
CURSOR c1 IS SELECT DEPTID FROM DEPT;
  BEGIN
    OPEN c1; 
    LOOP
      FETCH c1 INTO v_DepID;
      EXIT WHEN c1%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(RPAD(v_DepID, 7, ' '));
      INSERT INTO MESSAGES VALUES(v_DepID);  
    END LOOP; 
    CLOSE c1; 
  END newMESSAGE;
END;      
/                 
