CREATE TABLE CD_ATTENDEE
(
	Coder_Id             number(6) primary key,
	Coder_Name           VARCHAR2(50) not NULL ,
	Coder_Phone          CHAR(14) NULL ,
	Coder_Email          VARCHAR2(30) NULL ,
	Coder_Date_Of_Birth  DATE not NULL 
);
insert into CD_ATTENDEE (Coder_id, Coder_Name, Coder_Email, coder_date_of_Birth) values 
(4000,'Barry Keenan','barry@hmail.com', TO_DATE('10-02-2000','DD-MM-YYYY'));
insert into CD_ATTENDEE (Coder_id, Coder_Name, Coder_Email, coder_date_of_Birth) values 
(4001,'Pauline Brennan','pbrennan33@hmail.com', TO_DATE('31-08-1998','DD-MM-YYYY'));
insert into CD_ATTENDEE (Coder_id, Coder_Name, Coder_Email, coder_date_of_Birth) values 
(4002,'Ryan Kelleher','ryank55@hmail.com', TO_DATE('24-04-2000','DD-MM-YYYY'));
CREATE TABLE CD_LOCATION
(
	loc_id               CHAR(6) NOT NULL ,
	loc_name             VARCHAR2(30) NULL ,
	Loc_Contact_Name     VARCHAR2(50) NULL ,
	Loc_Phone            CHAR(14) NULL ,
	Loc_email            VARCHAR2(30) not NULL ,
 PRIMARY KEY (loc_id)
);
insert into CD_LOCATION values ('UNIV01','University','Professor','9999999','prof@univ.com');
insert into CD_LOCATION values ('HALL01','Community Hall','Joe Bloggs','9999998','joe@hall.com');
insert into CD_LOCATION values ('SCH001','Local School','Teacher','9989999','teacher@school.com');
CREATE TABLE CD_ORGANIZER
(
	Organizer_Id         number(6) primary key,
	Organizer_Name       VARCHAR2(50) not NULL ,
	Organizer_phone      CHAR(14) NULL ,
	Organizer_email      VARCHAR2(30) not NULL 
);
insert into CD_ORGANIZER (organizer_id, organizer_name, organizer_email) 
values (1,'Peter','peter@home.org');
insert into CD_ORGANIZER (organizer_id, organizer_name, organizer_email) 
values (2,'Jane','Jane@home.org');
insert into CD_ORGANIZER (organizer_id, organizer_name, organizer_email) 
values (3,'Brian','Brian@home.org');
insert into CD_ORGANIZER (organizer_id, organizer_name, organizer_email) 
values (4,'Sandra','Sandra@home.org');
insert into CD_ORGANIZER (organizer_id, organizer_name, organizer_email)
values (5, 'Mark','mark@coder.com');
CREATE TABLE CD_CODING_SESSION
(
	S_start              TIMESTAMP NOT NULL ,
	loc_id               CHAR(6) NOT NULL references CD_LOCATION,
	S_end                TIMESTAMP NULL ,
	Organizer_Id         number(6) NULL references CD_ORGANIZER,
 PRIMARY KEY (S_start,loc_id));
insert into CD_CODING_SESSION 
values (to_timestamp('10-02-2013 10:00:00','DD-MM-YYYY HH24:Mi:SS'),'UNIV01',
to_timestamp('10-02-2013 12:00:00','DD-MM-YYYY HH24:Mi:SS'),1);
insert into CD_CODING_SESSION 
values (to_timestamp('17-02-2013 10:00:00','DD-MM-YYYY HH24:Mi:SS'),'UNIV01',
to_timestamp('17-02-2013 12:00:00','DD-MM-YYYY HH24:Mi:SS'),1);
insert into CD_CODING_SESSION 
values (to_timestamp('10-02-2013 14:00:00','DD-MM-YYYY HH24:Mi:SS'),'HALL01',
to_timestamp('10-02-2013 16:00:00','DD-MM-YYYY HH24:Mi:SS'),2);
insert into CD_CODING_SESSION 
values (to_timestamp('17-02-2013 14:00:00','DD-MM-YYYY HH24:Mi:SS'),'HALL01',
to_timestamp('17-02-2013 16:00:00','DD-MM-YYYY HH24:Mi:SS'),2);
insert into CD_CODING_SESSION 
values (to_timestamp('24-02-2013 14:00:00','DD-MM-YYYY HH24:Mi:SS'),'HALL01',
to_timestamp('24-02-2013 16:00:00','DD-MM-YYYY HH24:Mi:SS'),2);

CREATE TABLE CD_SPECIALITY
(
	Spec_code            varchar2(6) NOT NULL ,
	Spec_name            VARCHAR2(30) NULL ,
	Spec_Equipment       VARCHAR2(50) NULL ,
	Spec_Software        varchar2(30) NULL ,
 PRIMARY KEY (Spec_code)
);
insert into CD_SPECIALITY (spec_code, spec_name) values
('HTML','HTML');
insert into CD_SPECIALITY (spec_code, spec_name) values
('SCRTCH','Scratch Programming');
insert into CD_SPECIALITY (spec_code, spec_name) values
('GENG','Games Engines');
insert into CD_SPECIALITY (spec_code, spec_name) values
('ROBOT','Robot programming');
CREATE TABLE CD_FACILITATOR
(
	Facilitator_Id       number(6) primary key,
	Facilitator_name    varchar2(50) not NULL ,
	Facilitator_phone    CHAR(14) NULL ,
	Facilitator_email    VARCHAR2(30) not NULL
);
insert into CD_FACILITATOR (facilitator_id, facilitator_name, Facilitator_email)
values (405, 'Mark Gladstone','markg@coder.com');
insert into CD_FACILITATOR (facilitator_id, facilitator_name, Facilitator_email)
values (410, 'Mark','mark@coder.com');
insert into CD_FACILITATOR (facilitator_id, facilitator_name, Facilitator_email)
values (415, 'Ken','ken@coder.com');
insert into CD_FACILITATOR (facilitator_id, facilitator_name, Facilitator_email)
values (420, 'Deirdre','deirdre@coder.com');
CREATE TABLE CD_SESSION_RUNS
(
	S_start              TIMESTAMP NOT NULL ,
	loc_id               CHAR(6) NOT NULL ,
	Spec_code            VARCHAR2(6) NOT NULL references CD_SPECIALITY,
	Facilitator_Id       number(6) NULL references CD_FACILITATOR,
 PRIMARY KEY (S_start,loc_id,Spec_code),
FOREIGN KEY (S_start, loc_id) REFERENCES CD_CODING_SESSION (S_start, loc_id));

insert into CD_SESSION_RUNS
values (to_timestamp('10-02-2013 10:00:00','DD-MM-YYYY HH24:Mi:SS'),'UNIV01',
'HTML',405);
insert into CD_SESSION_RUNS
values (to_timestamp('17-02-2013 10:00:00','DD-MM-YYYY HH24:Mi:SS'),'UNIV01',
'HTML',405);
insert into CD_SESSION_RUNS
values (to_timestamp('10-02-2013 10:00:00','DD-MM-YYYY HH24:Mi:SS'),'UNIV01',
'ROBOT',415);
insert into CD_SESSION_RUNS
values (to_timestamp('17-02-2013 10:00:00','DD-MM-YYYY HH24:Mi:SS'),'UNIV01',
'ROBOT',415);
insert into CD_SESSION_RUNS
values (to_timestamp('17-02-2013 14:00:00','DD-MM-YYYY HH24:Mi:SS'),'HALL01',
'HTML',405);
insert into CD_SESSION_RUNS
values (to_timestamp('10-02-2013 14:00:00','DD-MM-YYYY HH24:Mi:SS'),'HALL01',
'HTML',405);
insert into CD_SESSION_RUNS
values (to_timestamp('24-02-2013 14:00:00','DD-MM-YYYY HH24:Mi:SS'),'HALL01',
'HTML',405);
CREATE TABLE CD_ATTENDS
(
	Coder_Id             NUMBER NOT NULL references CD_ATTENDEE,
	S_start              TIMESTAMP NOT NULL ,
	loc_id               CHAR(6) NOT NULL ,
	Spec_code            VARCHAR2(6) NOT NULL ,
	Badge_Earned         VARCHAR2(6) NULL check(badge_earned in ('Basic','Junior','Senior','Master')),
	Belt_Earned          VARCHAR2(6) NULL check (belt_earned in ('Blue','Yellow','White')),
 PRIMARY KEY (Coder_Id,S_start,loc_id,Spec_code),
FOREIGN KEY (S_start, loc_id, Spec_code) REFERENCES CD_SESSION_RUNS (S_start, loc_id, Spec_code)
);
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code)
values (4000,to_timestamp('10-02-2013 10:00:00','DD-MM-YYYY HH24:Mi:SS'),'UNIV01',
'ROBOT');
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code)
values (4000,to_timestamp('17-02-2013 10:00:00','DD-MM-YYYY HH24:Mi:SS'),'UNIV01',
'ROBOT');
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code)
values (4001,to_timestamp('10-02-2013 10:00:00','DD-MM-YYYY HH24:Mi:SS'),'UNIV01',
'HTML');
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code)
values (4001,to_timestamp('17-02-2013 10:00:00','DD-MM-YYYY HH24:Mi:SS'),'UNIV01',
'HTML');
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code)
values (4001,to_timestamp('10-02-2013 14:00:00','DD-MM-YYYY HH24:Mi:SS'),'HALL01',
'HTML');
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code)
values (4001,to_timestamp('17-02-2013 14:00:00','DD-MM-YYYY HH24:Mi:SS'),'HALL01',
'HTML');
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code,badge_earned)
values (4001,to_timestamp('24-02-2013 14:00:00','DD-MM-YYYY HH24:Mi:SS'),'HALL01',
'HTML','Basic');
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code)
values (4002,to_timestamp('10-02-2013 10:00:00','DD-MM-YYYY HH24:Mi:SS'),'UNIV01',
'ROBOT');
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code)
values (4002,to_timestamp('17-02-2013 10:00:00','DD-MM-YYYY HH24:Mi:SS'),'UNIV01',
'ROBOT');
commit;

select CODER_NAME,CODER_EMAIL,round( MONTHS_BETWEEN(SYSDATE,CODER_DATE_OF_BIRTH)/12,0) AS their_age from CD_ATTENDEE where CODER_PHONE is null;

--Question 1
select CODER_NAME,CODER_EMAIL,round( MONTHS_BETWEEN(SYSDATE,CODER_DATE_OF_BIRTH)/12,0) their_age from CD_ATTENDEE where CODER_PHONE is null;

--Question2
select * from CD_ATTENDS join CD_ATTENDEE using (coder_id);

select coder_name,count(*) from CD_ATTENDS join CD_ATTENDEE using (coder_id) where coder_name like '%B%' group by coder_name having count(*)>1;

--Question3
select distinct organizer_name, loc_name from CD_CODING_SESSION join CD_ORGANIZER using (ORGANIZER_ID) join CD_LOCATION using (loc_ID); 

--Question5
select facilitator_name,spec_code from CD_FACILITATOR join CD_SESSION_RUNS using (facilitator_id);-- where spec_code is null;

CREATE TABLE TEMP_TABLE
(
  Coder_Id NUMBER NOT NULL,
  PRIMARY KEY (Coder_Id)
);
--FOR J IN 1..COUNT(CODER_ID);
select count (CODER_ID) AS CODER_NUMBER from CD_ATTENDS ;
