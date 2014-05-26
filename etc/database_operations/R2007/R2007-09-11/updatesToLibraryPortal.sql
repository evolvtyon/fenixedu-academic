--  SQL file representing changes to the functionalities model
--  Generated at Tue Sep 11 12:28:49 WEST 2007
--  DO NOT EDIT THIS FILE, run the generating script instead

--  Preamble
SET AUTOCOMMIT = 0;

START TRANSACTION;

-- 
--  Updating existing functionalities
-- 

--  ID: 269718 UUID: '6797c053-576f-4ec4-b50a-489470709106'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`PATH` = '/cardManagement.do?method=prepareGenerateMissingCards' WHERE own.`UUID` = '6797c053-576f-4ec4-b50a-489470709106';

--  ID: 269719 UUID: 'dc040672-f9f9-4bb4-a1c3-21bcc55ba8f7'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`PATH` = '/cardManagement.do?method=prepareGenerateMissingLetters' WHERE own.`UUID` = 'dc040672-f9f9-4bb4-a1c3-21bcc55ba8f7';

COMMIT;