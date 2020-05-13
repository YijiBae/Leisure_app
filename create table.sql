-- WALK���� ����
CREATE USER WALK
IDENTIFIED BY walk2017
DEFAULT TABLESPACE USR;

SELECT * FROM ALL_USERS;
SELECT * FROM DBA_USERS;

-- WALK�������� DB���� �� ��Ű�� ��ü �����ϴ� Ư�� �ο�
GRANT CONNECT, RESOURCE TO WALK;


--show.csv data // ���,��� ������ �ҷ�����
CREATE TABLE DATA_E(
   EVENTKEY NUMBER NOT NULL,
   ENAME VARCHAR2(50),
   ECONTENT VARCHAR2(400),
   ELOCATION VARCHAR2(50),
   ESTART_DATE DATE,
   EEND_DATE DATE,
   ESTART_TIME VARCHAR (20),
   EEND_TIME VARCHAR (20),
   EFEE NUMBER,
   EHOST VARCHAR2(50),
   ESUPERVISION VARCHAR2(50),
   INSNUMBER VARCHAR2(20),
   INSPAGE VARCHAR2(100),
   INSLOCATION VARCHAR2(50),
   INSL NUMBER
   );
   
--course.csv data // ����,��� ������ �ҷ�����
CREATE TABLE DATA_C(
   COURSEKEY NUMBER NOT NULL,
   CNAME VARCHAR2(100),
   CTEACHER VARCHAR2(150),
   CSTART_DATE DATE,
   CEND_DATE DATE,
   CSTART_TIME VARCHAR2(10),
   CEND_TIME VARCHAR2(10),
   CMETHOD VARCHAR2(10),
   CLOCATION VARCHAR2(300),
   CPEOPLENUM NUMBER,
   CFEE NUMBER,
   INSLOCATION VARCHAR2(100),
   INSNUMBER VARCHAR2(20),
   INSPAGE VARCHAR2(200),
   INSL NUMBER
   );

-- �ҷ����� ������ ���̺��κ��� ���α׷��� ����� ���̺� ����
--���
CREATE TABLE EVENT AS (
SELECT EVENTKEY, ENAME, ECONTENT, ELOCATION, ESTART_DATE, EEND_DATE, ESTART_TIME, EEND_TIME, EFEE, EHOST, ESUPERVISION
FROM DATA_E);

--����
CREATE TABLE COURSE AS (
SELECT COURSEKEY, CNAME, CTEACHER, CSTART_DATE, CEND_DATE, CSTART_TIME, CEND_TIME, CMETHOD, CLOCATION, CPEOPLENUM, CFEE
FROM DATA_C);

--���
CREATE TABLE EVENT AS (
SELECT 
FROM DATA_E);


--ȸ��
CREATE TABLE USER(
   NAME VARCHAR2(20) NOT NULL,
   FAMILY VARCHAR2(500) NOT NULL,
   USERLOCATION VARCHAR2(100) NOT NULL,
   L VARCHAR2(1000),
   PRIMARY KEY(NAME),
   PRIMARY KEY(FAMILY),
   FOREIGN KEY (L) REFERENCES LOCATION(LOCALKEY)   
   FOREIGN KEY (FAMILY) REFERENCES ALBUM(FAMILY)   
);
--����
CREATE TABLE SENIOR(
   SAJ VARCHAR2(20) NOT NULL,
   AGE NUMBER,
   GENDER VARCHAR2(5),
   N VARCHAR2(20),
   PRIMARY KEY (SAJ),
   FOREIGN KEY (N) REFERENCES USER(NAME)
);
--�ڳ�
CREATE TABLE JUNIOR(
   SAJ VARCHAR2(20) NOT NULL,
   N VARCHAR2(20),
   PRIMARY KEY (SAJ),
   FOREIGN KEY (N) REFERENCES USER(NAME)
);

--����(���α׷�)
CREATE TABLE course(
   COURSEKEY VARCHAR2(10) NOT NULL,
   CNAME VARCHAR2(100),
   CTEACHER VARCHAR2(200),
   CSTART_DATE VARCHAR2(200),
   CEND_DATE VARCHAR2(200),
   CSTART_TIME VARCHAR2(200),
   CEND_TIME VARCHAR2(200),
   CCONTENT VARCHAR2(1000),
   CMETHOD VARCHAR2(500),
   CLOCATION VARCHAR2(1000),
   CPEOPLENUM NUMBER,
   CFEE NUMBER,
   PRIMARY KEY (PROGRAMKEY),
   FOREIGN KEY (PMANAGEMENT) REFERENCES INSITUTION(MANAGEMENT)
);
--���
CREATE TABLE INSITUTION(
   INSNAME VARCHAR2(10) NOT NULL,
   INSNUMBER VARCHAR2(100),
   INSL VARCHAR2(1000),
   INSPAGE VARCHAR2(1000),
   INSLOCATION VARCHAR2(1000),
   PRIMARY KEY (INSNAME),
   FOREIGN KEY (INSL) REFERENCES LOCATION(LOCALKEY)   
);
--����
CREATE TABLE LOCATION(
   LOCALKEY VARCHAR2(1000)NOT NULL,
   LOCALNAME VARCHAR2(1000)
);
--�ٹ�
CREATE TABLE ALBUM(
   FAMILY VARCHAR2(500) NOT NULL,
   UPTIME VARCHAR2(500),
   PRIMARY KEY (FAMILY) 
);
--�����ȸ
CREATE TABLE EVENTLOOKUP(
   ELNAME VARCHAR2()