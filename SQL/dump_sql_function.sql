create table sequencias(
   nm_sequencia varchar(50) 
          not null unique primary key,
   vl_sequencia int not null
);

SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS GetSequenceVal;  

DELIMITER :)  
CREATE FUNCTION GetSequenceVal( sSeqName VARCHAR(32))  
RETURNS INT    
BEGIN  
  DECLARE iSeqValue INT; 
  
  IF NOT EXISTS ( SELECT * FROM SEQUENCIAS WHERE (NM_SEQUENCIA = sSeqName) ) THEN  
    INSERT INTO SEQUENCIAS (NM_SEQUENCIA, VL_SEQUENCIA)  
    VALUES (sSeqName   , 0  );  
  END IF;   

 

  SELECT VL_SEQUENCIA FROM SEQUENCIAS 
  WHERE  (NM_SEQUENCIA = sSeqName )  
  INTO   @iSeqValue;  

 

  SET @iSeqValue = @iSeqValue + 1;

 

  UPDATE SEQUENCIAS SET VL_SEQUENCIA = @iSeqValue  
    WHERE  ( NM_SEQUENCIA = sSeqName );  

 


  RETURN @iSeqValue;
END :)  
DELIMITER ;