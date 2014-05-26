SET AUTOCOMMIT = 0;

START TRANSACTION;

INSERT INTO CONTENT (EXECUTION_PATH,VISIBLE,KEY_MODULE_ROOT_DOMAIN_OBJECT,MAXIMIZABLE,PREFIX,KEY_INITIAL_CONTENT,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_PORTAL,KEY_AVAILABILITY_POLICY,KEY_ROOT_DOMAIN_OBJECT,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES (null,null,null,null,'/residenceManagement',null,'b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293','2008-07-03 11:49:18','pt21:Núcleo de Alojamentos','pt21:Núcleo de Alojamentos',null,null,'pt21:nucleo-de-alojamentos',null,null,1,null,'net.sourceforge.fenixedu.domain.functionalities.Module')  ;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_CHILD,KEY_PARENT,KEY_ROOT_DOMAIN_OBJECT,OJB_CONCRETE_CLASS) VALUES (41,1,1,'382b0518-1431-102b-8308-0016ec91a6df:b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293',1,2,1,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

UPDATE CONTENT SET EXECUTION_PATH=null,VISIBLE=null,KEY_MODULE_ROOT_DOMAIN_OBJECT=null,MAXIMIZABLE=null,PREFIX='/residenceManagement',KEY_INITIAL_CONTENT=null,CONTENT_ID='b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293',CREATION_DATE='2008-07-03 11:49:18',NAME='pt21:Núcleo de Alojamentos',TITLE='pt21:Núcleo de Alojamentos',BODY=null,DESCRIPTION=null,NORMALIZED_NAME='pt21:nucleo-de-alojamentos',KEY_PORTAL=null,KEY_AVAILABILITY_POLICY=null,KEY_ROOT_DOMAIN_OBJECT=1,KEY_CREATOR=null,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.functionalities.Module' WHERE CONTENT_ID = 'b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293'  ;

UPDATE NODE SET NODE_ORDER=41,ASCENDING=1,VISIBLE=1,CONTENT_ID='382b0518-1431-102b-8308-0016ec91a6df:b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293',KEY_CHILD=3,KEY_PARENT=4,KEY_ROOT_DOMAIN_OBJECT=1,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode' WHERE CONTENT_ID = '382b0518-1431-102b-8308-0016ec91a6df:b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293'  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(1,'b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293','382b0518-1431-102b-8308-0016ec91a6df:b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(2,'382b0518-1431-102b-8308-0016ec91a6df','382b0518-1431-102b-8308-0016ec91a6df:b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(3,'b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293','382b0518-1431-102b-8308-0016ec91a6df:b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(4,'382b0518-1431-102b-8308-0016ec91a6df','382b0518-1431-102b-8308-0016ec91a6df:b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO CONTENT (EXECUTION_PATH,VISIBLE,KEY_EXECUTION_PATH_VALUE,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_PORTAL,KEY_AVAILABILITY_POLICY,KEY_ROOT_DOMAIN_OBJECT,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES ('/index.do',null,5,'9f12f6d7-b92a-4fb6-9e62-98719cf0655a','2008-07-03 11:49:44','pt14:Página Inicial','pt14:Página Inicial',null,null,'pt14:pagina-inicial',null,null,1,null,'net.sourceforge.fenixedu.domain.functionalities.Functionality')  ;

INSERT INTO EXECUTION_PATH (EXECUTION_PATH,CONTENT_ID,KEY_FUNCTIONALITY,KEY_ROOT_DOMAIN_OBJECT) VALUES ('/index.do','52fb4636-32ac-493a-9a93-266e4a9362e4',6,1)  ;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_CHILD,KEY_PARENT,KEY_ROOT_DOMAIN_OBJECT,OJB_CONCRETE_CLASS) VALUES (0,1,1,'b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293:9f12f6d7-b92a-4fb6-9e62-98719cf0655a',7,8,1,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

UPDATE CONTENT SET EXECUTION_PATH='/index.do',VISIBLE=null,KEY_EXECUTION_PATH_VALUE=9,CONTENT_ID='9f12f6d7-b92a-4fb6-9e62-98719cf0655a',CREATION_DATE='2008-07-03 11:49:44',NAME='pt14:Página Inicial',TITLE='pt14:Página Inicial',BODY=null,DESCRIPTION=null,NORMALIZED_NAME='pt14:pagina-inicial',KEY_PORTAL=null,KEY_AVAILABILITY_POLICY=null,KEY_ROOT_DOMAIN_OBJECT=1,KEY_CREATOR=null,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.functionalities.Functionality' WHERE CONTENT_ID = '9f12f6d7-b92a-4fb6-9e62-98719cf0655a'  ;

UPDATE EXECUTION_PATH SET EXECUTION_PATH='/index.do',CONTENT_ID='52fb4636-32ac-493a-9a93-266e4a9362e4',KEY_FUNCTIONALITY=10,KEY_ROOT_DOMAIN_OBJECT=1 WHERE CONTENT_ID = '52fb4636-32ac-493a-9a93-266e4a9362e4'  ;

UPDATE NODE SET NODE_ORDER=0,ASCENDING=1,VISIBLE=1,CONTENT_ID='b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293:9f12f6d7-b92a-4fb6-9e62-98719cf0655a',KEY_CHILD=11,KEY_PARENT=12,KEY_ROOT_DOMAIN_OBJECT=1,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode' WHERE CONTENT_ID = 'b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293:9f12f6d7-b92a-4fb6-9e62-98719cf0655a'  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(5,'TOKEN(EXECUTION_PATH,1350)','9f12f6d7-b92a-4fb6-9e62-98719cf0655a') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(6,'9f12f6d7-b92a-4fb6-9e62-98719cf0655a','52fb4636-32ac-493a-9a93-266e4a9362e4') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(7,'9f12f6d7-b92a-4fb6-9e62-98719cf0655a','b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293:9f12f6d7-b92a-4fb6-9e62-98719cf0655a') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(8,'b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293','b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293:9f12f6d7-b92a-4fb6-9e62-98719cf0655a') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(9,'52fb4636-32ac-493a-9a93-266e4a9362e4','9f12f6d7-b92a-4fb6-9e62-98719cf0655a') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(10,'9f12f6d7-b92a-4fb6-9e62-98719cf0655a','52fb4636-32ac-493a-9a93-266e4a9362e4') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(11,'9f12f6d7-b92a-4fb6-9e62-98719cf0655a','b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293:9f12f6d7-b92a-4fb6-9e62-98719cf0655a') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(12,'b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293','b2ed8d40-1d12-45a2-a4e4-9eb43f0a7293:9f12f6d7-b92a-4fb6-9e62-98719cf0655a') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_CHILD,KEY_PARENT,KEY_ROOT_DOMAIN_OBJECT,OJB_CONCRETE_CLASS) VALUES (53,1,1,'382b0734-1431-102b-8308-0016ec91a6df:95c341a7-3a0b-4e55-b732-cd90c90266c7',13,14,1,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

INSERT INTO CONTENT (ENABLED,MODIFICATION_DATE,MAXIMIZABLE,PREFIX,KEY_INITIAL_CONTENT,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_PORTAL,KEY_AVAILABILITY_POLICY,KEY_ROOT_DOMAIN_OBJECT,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES (null,null,null,null,null,'95c341a7-3a0b-4e55-b732-cd90c90266c7','2008-07-03 11:49:56','pt21:Núcleo de Alojamentos',null,null,null,'pt21:nucleo-de-alojamentos',null,null,1,null,'net.sourceforge.fenixedu.domain.Section')  ;

UPDATE NODE SET NODE_ORDER=53,ASCENDING=1,VISIBLE=1,CONTENT_ID='382b0734-1431-102b-8308-0016ec91a6df:95c341a7-3a0b-4e55-b732-cd90c90266c7',KEY_CHILD=15,KEY_PARENT=16,KEY_ROOT_DOMAIN_OBJECT=1,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode' WHERE CONTENT_ID = '382b0734-1431-102b-8308-0016ec91a6df:95c341a7-3a0b-4e55-b732-cd90c90266c7'  ;

UPDATE CONTENT SET ENABLED=null,MODIFICATION_DATE=null,MAXIMIZABLE=null,PREFIX=null,KEY_INITIAL_CONTENT=null,CONTENT_ID='95c341a7-3a0b-4e55-b732-cd90c90266c7',CREATION_DATE='2008-07-03 11:49:56',NAME='pt21:Núcleo de Alojamentos',TITLE=null,BODY=null,DESCRIPTION=null,NORMALIZED_NAME='pt21:nucleo-de-alojamentos',KEY_PORTAL=null,KEY_AVAILABILITY_POLICY=null,KEY_ROOT_DOMAIN_OBJECT=1,KEY_CREATOR=null,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.Section' WHERE CONTENT_ID = '95c341a7-3a0b-4e55-b732-cd90c90266c7'  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(13,'95c341a7-3a0b-4e55-b732-cd90c90266c7','382b0734-1431-102b-8308-0016ec91a6df:95c341a7-3a0b-4e55-b732-cd90c90266c7') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(14,'382b0734-1431-102b-8308-0016ec91a6df','382b0734-1431-102b-8308-0016ec91a6df:95c341a7-3a0b-4e55-b732-cd90c90266c7') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(15,'95c341a7-3a0b-4e55-b732-cd90c90266c7','382b0734-1431-102b-8308-0016ec91a6df:95c341a7-3a0b-4e55-b732-cd90c90266c7') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(16,'382b0734-1431-102b-8308-0016ec91a6df','382b0734-1431-102b-8308-0016ec91a6df:95c341a7-3a0b-4e55-b732-cd90c90266c7') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO CONTENT (KEY_FUNCTIONALITY,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_PORTAL,KEY_AVAILABILITY_POLICY,KEY_ROOT_DOMAIN_OBJECT,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES (17,'c415ff76-6879-48ee-8bc7-ce27858746c0','2008-07-03 11:50:10',null,null,null,null,null,null,null,1,null,'net.sourceforge.fenixedu.domain.contents.FunctionalityCall')  ;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_CHILD,KEY_PARENT,KEY_ROOT_DOMAIN_OBJECT,OJB_CONCRETE_CLASS) VALUES (0,1,1,'95c341a7-3a0b-4e55-b732-cd90c90266c7:c415ff76-6879-48ee-8bc7-ce27858746c0',18,19,1,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

UPDATE CONTENT SET KEY_FUNCTIONALITY=20,CONTENT_ID='c415ff76-6879-48ee-8bc7-ce27858746c0',CREATION_DATE='2008-07-03 11:50:10',NAME=null,TITLE=null,BODY=null,DESCRIPTION=null,NORMALIZED_NAME=null,KEY_PORTAL=null,KEY_AVAILABILITY_POLICY=null,KEY_ROOT_DOMAIN_OBJECT=1,KEY_CREATOR=null,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.contents.FunctionalityCall' WHERE CONTENT_ID = 'c415ff76-6879-48ee-8bc7-ce27858746c0'  ;

UPDATE NODE SET NODE_ORDER=0,ASCENDING=1,VISIBLE=1,CONTENT_ID='95c341a7-3a0b-4e55-b732-cd90c90266c7:c415ff76-6879-48ee-8bc7-ce27858746c0',KEY_CHILD=21,KEY_PARENT=22,KEY_ROOT_DOMAIN_OBJECT=1,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode' WHERE CONTENT_ID = '95c341a7-3a0b-4e55-b732-cd90c90266c7:c415ff76-6879-48ee-8bc7-ce27858746c0'  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(17,'9f12f6d7-b92a-4fb6-9e62-98719cf0655a','c415ff76-6879-48ee-8bc7-ce27858746c0') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(18,'c415ff76-6879-48ee-8bc7-ce27858746c0','95c341a7-3a0b-4e55-b732-cd90c90266c7:c415ff76-6879-48ee-8bc7-ce27858746c0') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(19,'95c341a7-3a0b-4e55-b732-cd90c90266c7','95c341a7-3a0b-4e55-b732-cd90c90266c7:c415ff76-6879-48ee-8bc7-ce27858746c0') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(20,'9f12f6d7-b92a-4fb6-9e62-98719cf0655a','c415ff76-6879-48ee-8bc7-ce27858746c0') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(21,'c415ff76-6879-48ee-8bc7-ce27858746c0','95c341a7-3a0b-4e55-b732-cd90c90266c7:c415ff76-6879-48ee-8bc7-ce27858746c0') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(22,'95c341a7-3a0b-4e55-b732-cd90c90266c7','95c341a7-3a0b-4e55-b732-cd90c90266c7:c415ff76-6879-48ee-8bc7-ce27858746c0') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;



COMMIT;