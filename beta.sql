/*main branch to beta file for procedure*/
CREATE OR REPLACE PROCEDURE newMESSAGES 
IS
BEGIN
DELETE FROM MESSAGES;
DECLARE
v_DepID varchar2(150);
v_Major varchar2(150);
CURSOR c1 IS SELECT DEPTID FROM DEPT;
CURSOR c2 IS SELECT DESCRIPTION FROM MAJOR WHERE DEPTID = v_DepID;
BEGIN
OPEN c1; 
LOOP
/*c1 loop*/
FETCH c1 INTO v_DepID;
EXIT WHEN c1%NOTFOUND;
END LOOP;
CLOSE c1;
OPEN c2;
LOOP
FETCH c2 INTO v_Major;
EXIT WHEN c2%NOTFOUND;
INSERT INTO MESSAGES VALUES(v_DepID ||'*' || v_Major); 
END LOOP;
CLOSE c2;
END newMESSAGE;
END;      
/                 
