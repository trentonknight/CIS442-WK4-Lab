/*main branch to beta file for procedure*/
CREATE OR REPLACE PROCEDURE newMESSAGES 
IS
BEGIN
/*clear out old table data*/
DELETE FROM MESSAGES;
DECLARE
v_DepID varchar2(150);
v_Major varchar2(150);
CURSOR c1 IS SELECT DEPTID FROM DEPT;
/*set cursor to select only matching majors with deptid*/
CURSOR c2 IS SELECT DESCRIPTION FROM MAJOR WHERE DEPTID = v_DepID;
BEGIN
OPEN c1; 
LOOP
/*c1 loop*/
FETCH c1 INTO v_DepID;
EXIT WHEN c1%NOTFOUND;
OPEN c2;
LOOP
/*nested c2 loop*/
FETCH c2 INTO v_Major;
EXIT WHEN c2%NOTFOUND;
/*append matched depid to major*/
INSERT INTO MESSAGES VALUES(v_DepID ||'*' || v_Major);
/*end loop for cursor 2*/
END LOOP;
CLOSE c2;
/*end loop for cursor 1*/
END LOOP;
CLOSE c1;
/*end procedure*/
END newMESSAGE;
END;      
/                 
