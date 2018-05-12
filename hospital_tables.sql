--Drop table patient if already existing
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE PATIENT CASCADE CONSTRAINT PURGE';
	EXCEPTION
    WHEN OTHERS THEN
    NULL;
END;
/
--Create table patient
create table patient (
pat_id varchar2(10 CHAR),
pat_name varchar2(60 CHAR),
pat_gender varchar2(2 CHAR),
pat_address varchar2(100 CHAR),
pat_number number(11,0),
pat_doc_code varchar2(10 CHAR),
constraint pk_patient primary key (pat_id),
constraint uq_doc_code unique (pat_doc_code)
);
/

--Drop table patient_diagnosis if already existing
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE PATIENT_DIAGNOSIS CASCADE CONSTRAINT PURGE';
	EXCEPTION
    WHEN OTHERS THEN
    NULL;
END;
/
--Create table patient_diagnosis
create table patient_diagnosis(
Diag_ID varchar2(10 CHAR),
diag_details varchar2(200 CHAR),
diag_remarks varchar2(200 CHAR),
diag_date date,
pat_id varchar2(10 CHAR),
constraint pk_patient_diagnosis primary key  (diag_id),
constraint fk_pat_id foreign key (pat_id)
references patient(pat_id)
);
/

--Drop table doctor if already existing
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE DOCTOR CASCADE CONSTRAINT PURGE';
	EXCEPTION
    WHEN OTHERS THEN
    NULL;
END;
/
--create table doctor
create table doctor(
doc_code varchar2(10 CHAR),
doc_name varchar2(60 CHAR),
doc_gender varchar2(2 CHAR),
doc_address varchar2(200 CHAR),
doc_designation varchar2(30 CHAR),
doc_number number(11,0),
constraint pk_doctor primary key (doc_code),
constraint fk_doc_code foreign key (doc_code)
references patient(pat_doc_code)
);
/

--Drop table bill if already existing
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE BILL CASCADE CONSTRAINT PURGE';
	EXCEPTION
    WHEN OTHERS THEN
    NULL;
END;
/
--create table bill
create table bill(
bill_no integer,
pat_id varchar2(10 CHAR),
pat_name varchar2(60 CHAR),
pat_gender varchar2(2 CHAR),
pat_address varchar2(100 CHAR),
doc_name varchar2(60 CHAR),
amount NUMBER(19,9),
constraint pk_bill primary key (bill_no),
constraint fk_bill_pat_id foreign key (pat_id)
references patient(pat_id)
);
/

--PATIENT ENTRIES:
INSERT INTO PATIENT VALUES ('P001','Raghav Sharma','M','#33, Sec 22, Gurugram',1111111111,'D001');
INSERT INTO PATIENT VALUES ('P002','Shivam Kumar','M','#2789, Udhyog Vihar P-2, Gurugram',2222222222,'D004');
INSERT INTO PATIENT VALUES ('P003','Kiran','F','#3672, Sec 37D, Chandigarh',3333333333,'D003');
INSERT INTO PATIENT VALUES ('P004','Akshay Chauchan','M','#4534, Sec 57C, Delhi',4444444444,'D005');
INSERT INTO PATIENT VALUES ('P005','Karan Chaudary','M','Tamil Nadu',5555555555,'D002');

--Patient_diagnosis ENTRIES:
INSERT INTO PATIENT_DIAGNOSIS VALUES ('DIAG001','Suffering from asthma','Need to use rescue inhalers',sysdate,'P001');
INSERT INTO PATIENT_DIAGNOSIS VALUES ('DIAG002','Suffering from heart diseases','Treatments vary widely and can include lifestyle changes, medication, surgery, stents, pacemakers and ablation.',sysdate,'P002');
INSERT INTO PATIENT_DIAGNOSIS VALUES ('DIAG003','Suffering from skin diseases','Use anti-fungal sprays/creams to treat the skin infection',sysdate,'P003');
INSERT INTO PATIENT_DIAGNOSIS VALUES ('DIAG004','Suffering from mouth diseases','Need to use pain relievers',sysdate,'P004');
INSERT INTO PATIENT_DIAGNOSIS VALUES ('DIAG005','Suffering from migrane','Avoid stress, improve sleep habit and have a balanced diet',sysdate,'P005');

--DOCTOR Entries:
INSERT INTO DOCTOR VALUES ('D001','Dr P R Goyal','M','H1/10, Hauz Khas, New Delhi, Delhi','Allergist',9810506571);
INSERT INTO DOCTOR VALUES ('D002','Dr Jagmeet Soin','M','94/4, GNH Hospital, Opposite Govt. Girls College, Near Sector 14, Gurugram, Haryana 122001','Cardiologist',8800188336);
INSERT INTO DOCTOR VALUES ('D003','Dr Priyanka Yadav','F','CLACS, GNH Hospital, MG Road, Opp. Govt Girls College, Anamika Enclave, Gurugram, Haryana 122001','Dermatologist',7042795770);
INSERT INTO DOCTOR VALUES ('D004','Dr Kaushal Yadav','M','Sector 14, Gurugram, Haryana','Oral Surgeon',8800188336);
INSERT INTO DOCTOR VALUES ('D005','Dr. Praveen Gupta','M','Fortis Memorial Research Institute Sector 44, Opposite HUDA City Centre Metro Station, Gurugram, Haryana 122002','Neurologist',9990766036);
