/*
CS442
Lab 4
Sample proc
*/


-- Drop the old CreateMessage procedure if there is one

CREATE OR REPLACE PROCEDURE CreateMessage

/*
 Clear the MESSAGES table
 Populate the MESSAGES table with the concatanation of Department ID*Major description.
*/


--CREATE PROCEDURE CreateMessage()
 
BEGIN

   
  -- Declare variables to hold table data from cursors
  
DECLARE DepartmentID varchar(3) DEFAULT '';
  
DECLARE MajorDesc varchar(60) DEFAULT '';

  
-- Delete the values from the MESSAGES table
  
DELETE FROM MESSAGES;

 
-- Clear the DepartmentID value
  
SET DepartmentID = '';

  
-- Create a BEGIN..END Block for the first cursor
 

CURSOR1: 
BEGIN

    
  -- Declare the Cursor for the Departments
  
DECLARE DepartmentCursor; 
CURSOR FOR
   SELECT deptid 
     FROM dept;
       
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET DepartmentID = '';

      
    -- Open the Department Cursor
   
OPEN DepartmentCursor;

    
-- Fetch the first value
    
FETCH DepartmentCursor INTO DepartmentID;

    
-- While we have Departments
    
WHILE DepartmentID <> '' 
  DO

         
    -- Create a BEGIN..END Block for the second cursor
     
-- This allows me to manage the scope of the Continue Handler
     
-- and declare the cursor midway through my script 
    

 CURSOR2: 
 BEGIN

       
  -- Declare the cursor for the Majors
     
 DECLARE MajorCursor CURSOR FOR
      SELECT description
            FROM major
	          WHERE deptid = DepartmentID;
		       
		   DECLARE CONTINUE HANDLER FOR NOT FOUND SET MajorDesc = '';

		       
		  -- Open the cursor for the majors
      
 OPEN MajorCursor;
      
  FETCH MajorCursor INTO MajorDesc;

       
   -- While we have majors to process
      
  WHILE MajorDesc <> '' 
      DO

	       
	-- Insert into the MESSAGES table the concatonation of DepartmentID * Major Desciption
       
  INSERT INTO MESSAGES()
         
    VALUES(CONCAT(DepartmentID, '*', MajorDesc));

           
    -- Fetch the next major
       
  FETCH MajorCursor INTO MajorDesc;
        
    END WHILE;

    -- Close the Cursor
      
 CLOSE MajorCursor;

    
-- End the BEGIN..END block for Cursor2, thus ending its scope
     
 END CURSOR2;

     
-- Fetch the next department
     
 FETCH DepartmentCursor INTO DepartmentID;
    
END WHILE;

  
-- Close the department cursor
   
CLOSE DepartmentCursor;
  
-- End the BEGIN..END block for Cursor1, thus ending its scope
  
END CURSOR1;

 
END;
.
run;
