alter table ACCOUNT change column ACCOUNT_TYPE ACCOUNT_TYPE varchar(250) NOT NULL;
alter table ACCOUNT add column CREATION_DATE datetime NULL;

update ACCOUNT set CREATION_DATE = CURRENT_TIMESTAMP() WHERE CREATION_DATE IS NULL;

alter table ACCOUNT change column CREATION_DATE CREATION_DATE datetime NOT NULL;