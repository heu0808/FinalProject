--���������� ��� ���̺� ����
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/

--���������� ��� ������ ����
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/

--���������� ��� �� ����
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
-----------���̺�----------
-- MEMBER(����/ȸ��)���̺�
CREATE TABLE MEMBER(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_EMAIL VARCHAR2(60) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(60) NOT NULL,
    MEM_NAME VARCHAR2(60) NOT NULL,
    MEM_CONCERN VARCHAR2(30),
    MEM_PRO NUMBER DEFAULT 1 NOT NULL,
    PHONE VARCHAR2(30) NOT NULL,
    LOCATION VARCHAR2(100),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    MEM_GEN VARCHAR2(10) NOT NULL CHECK(MEM_GEN IN ('M','F')), 
    POINT NUMBER,
    FILE_PATH VARCHAR2(3000),
    ACCOUNT NUMBER DEFAULT 0,
    INTRO VARCHAR2(3000)
);

--��� ������
CREATE SEQUENCE SEQ_MNO
START WITH 2
INCREMENT BY 1
MAXVALUE 99
NOCYCLE
NOCACHE;

----SORT(�з�(ī�װ�����))���̺�
--CREATE TABLE SORT(
--    SORT_NO NUMBER PRIMARY KEY,
--    SORT_NAME VARCHAR2(300) NOT NULL
--);
--
----SORT ������
--CREATE SEQUENCE SEQ_SNO
--START WITH 100
--INCREMENT BY 1
--MAXVALUE 199
--NOCYCLE
--NOCACHE;

--CATEGORY(ī�װ���)���̺�
CREATE TABLE CATEGORY(
    CATEGORY_NO NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(200) NOT NULL
);

--CATEGORY ������
CREATE SEQUENCE SEQ_CNO
START WITH 200
INCREMENT BY 1
MAXVALUE 299
NOCYCLE
NOCACHE;

CREATE TABLE PROFESSIONAL(
    PRO_NO NUMBER PRIMARY KEY,
    PRO_JOB VARCHAR2(60),
    CATEGORY_NO NUMBER REFERENCES CATEGORY(CATEGORY_NO),
    MEM_NO NUMBER REFERENCES MEMBER(MEM_NO)
);

--PRO ������
CREATE SEQUENCE SEQ_PNO
START WITH 300
INCREMENT BY 1
MAXVALUE 999
NOCYCLE
NOCACHE;

-- BOARD(�Խ���)���̺�
CREATE TABLE BOARD(
  BOARD_NO NUMBER PRIMARY KEY,
  BOARD_TITLE VARCHAR2(60) NOT NULL,
  BOARD_CONTENT VARCHAR2(3000) NOT NULL,
  PRICE NUMBER,
  BOARD_TYPE NUMBER CHECK(BOARD_TYPE IN(1, 2, 3)),
  CREATEDATE DATE DEFAULT SYSDATE NOT NULL,
  STATUS VARCHAR2(3) DEFAULT 'Y',
  MEM_NO NUMBER REFERENCES MEMBER(MEM_NO),
  CATEGORY_NO NUMBER REFERENCES CATEGORY(CATEGORY_NO)
);

--BOARD ������
CREATE SEQUENCE SEQ_BNO
START WITH 1000
INCREMENT BY 1
MAXVALUE 9999
NOCYCLE
NOCACHE;

--ATTACHMENT���̺�
CREATE TABLE ATTACHMENT(
    ATT_NO NUMBER PRIMARY KEY,
    ORIGIN_NAME VARCHAR2(2000) NOT NULL,
    CHANGE_NAME VARCHAR2(2000) NOT NULL,
    FILE_PATH VARCHAR2(3000),
    STATUS VARCHAR2(3) DEFAULT 'Y',
    BOARD_NO NUMBER REFERENCES BOARD(BOARD_NO)
);

---------------------���̵�����-----------------------
-- ���
INSERT INTO MEMBER VALUES(1, 'admin@naver.com', '1234' ,'������', '����', 1,
        '010-1111-0000', '����� ������', 'Y', 'M', '4', 'C:\Users\���� ȭ��', NULL, NULL);
INSERT INTO MEMBER VALUES(SEQ_MNO.NEXTVAL, 'user01@naver.com','1234' ,'ȫ�浿', '����', 1, 
        '010-1111-1111', '����� ���ı�', 'Y', 'M', '4', 'C:\Users\���� ȭ��', NULL, NULL);

INSERT INTO MEMBER(
            MEM_NO,
			MEM_EMAIL,
			MEM_PWD,
			MEM_NAME,
			MEM_CONCERN,
			PHONE,
			MEM_GEN,
            INTRO
		)
		VALUES(
            SEQ_MNO.NEXTVAL,
			'aaa@naver.com',
			'1111',
			'�谳��',
			'�丮',
			'010-2222-2222',
			'M',
            NULL
		);
--ī�װ���
INSERT INTO CATEGORY VALUES(SEQ_CNO.NEXTVAL, '����');
INSERT INTO CATEGORY VALUES(SEQ_CNO.NEXTVAL, '�');
INSERT INTO CATEGORY VALUES(SEQ_CNO.NEXTVAL, '����');
INSERT INTO CATEGORY VALUES(SEQ_CNO.NEXTVAL, '�̼�');
INSERT INTO CATEGORY VALUES(SEQ_CNO.NEXTVAL, '����');
INSERT INTO CATEGORY VALUES(SEQ_CNO.NEXTVAL, '�丮');

--����
INSERT INTO PROFESSIONAL VALUES(SEQ_PNO.NEXTVAL, '�ǾƴϽ�Ʈ', 200, 2);

--�Խ���(����)
INSERT INTO BOARD VALUES(SEQ_BNO.NEXTVAL, '���Ƿ����մϴ�', '���� ���� ��̰� �˷������', 50000, 1, SYSDATE, 'Y', 2, 200);
INSERT INTO BOARD VALUES(SEQ_BNO.NEXTVAL, 'Ŀ�´�Ƽ�� ���Ƿ����մϴ�1', 'Ŀ�´�Ƽ�� ���� ���� ��̰� �˷������', 50000, 3, SYSDATE, 'Y', 2, 200);
INSERT INTO BOARD VALUES(SEQ_BNO.NEXTVAL, 'Ŀ�´�Ƽ�� ���Ƿ����մϴ�2', 'Ŀ�´�Ƽ�� ���� ���� ��̰� �˷������', 40000, 3, SYSDATE, 'Y', 2, 200);
INSERT INTO BOARD VALUES(SEQ_BNO.NEXTVAL, 'Ŀ�´�Ƽ�� ���Ƿ����մϴ�3', 'Ŀ�´�Ƽ�� ���� ���� ��̰� �˷������', 40000, 3, SYSDATE, 'Y', 2, 200);
INSERT INTO BOARD VALUES(SEQ_BNO.NEXTVAL, 'Ŀ�´�Ƽ�� ���Ƿ����մϴ�4', 'Ŀ�´�Ƽ�� ���� ���� ��̰� �˷������', 40000, 3, SYSDATE, 'Y', 2, 200);
INSERT INTO BOARD VALUES(SEQ_BNO.NEXTVAL, 'Ŀ�´�Ƽ�� ���Ƿ����մϴ�5', 'Ŀ�´�Ƽ�� ���� ���� ��̰� �˷������', 40000, 3, SYSDATE, 'Y', 2, 200);
INSERT INTO BOARD VALUES(SEQ_BNO.NEXTVAL, 'Ŀ�´�Ƽ�� ���Ƿ����մϴ�6', 'Ŀ�´�Ƽ�� ���� ���� ��̰� �˷������', 40000, 3, SYSDATE, 'Y', 2, 200);
INSERT INTO BOARD VALUES(SEQ_BNO.NEXTVAL, 'Ŀ�´�Ƽ�� ����¡ó��', 'Ŀ�´�Ƽ�� ���� ���� ��̰� �˷������', 40000, 3, SYSDATE, 'Y', 2, 200);
-- ATTACHEMT ����

        
---Ʈ�����
commit;