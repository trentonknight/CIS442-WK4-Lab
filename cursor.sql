DECLARE
v_DepID varchar2(150);
CURSOR c1 IS SELECT DEPTID FROM DEPT WHERE REGEXP_LIKE (DNAME, 'Computer Science');
BEGIN
  OPEN c1;
  LOOP
  FETCH c1 INTO v_DepID;
  EXIT WHEN c1%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE(RPAD(v_DepID, 7, ' '));
  DBMS_OUTPUT.PUT_LINE( '-------------------------------------' );
END LOOP;
CLOSE c1;
END;
/
