--================================================
--관리자계정 system
--================================================
--ifwe 계정생성
 create user ifwe identified by ifwe
 default tablespace users;
 
 grant connect, resource to ifwe;
--=================================================================
-- ifwe
--=================================================================

--DROP TABLE member CASCADE CONSTRAINT;
--DROP TABLE  MEMBER_REPORT CASCADE CONSTRAINT;
--DROP TABLE  MEMBER CASCADE CONSTRAINT;
--DROP TABLE  BOARD_CATEGORY CASCADE CONSTRAINT;
--DROP TABLE  TBL_SEARCH CASCADE CONSTRAINT;
--DROP TABLE  BOARD_COMMENT CASCADE CONSTRAINT;
--DROP TABLE  CONTENTS_INFO CASCADE CONSTRAINT;
--DROP TABLE  BOARD CASCADE CONSTRAINT;
--DROP TABLE  CONTENTS_INFO CASCADE CONSTRAINT;
--DROP TABLE  MEMBER_PROFILE CASCADE CONSTRAINT;
--DROP TABLE  MEMBER_EVENT CASCADE CONSTRAINT;
--DROP TABLE  CONTENTS_CATEGORY CASCADE CONSTRAINT;
--DROP TABLE  EVENT CASCADE CONSTRAINT;
--DROP TABLE  CLUB CASCADE CONSTRAINT;
--DROP TABLE  CONTENTS_IMG CASCADE CONSTRAINT;
--DROP TABLE  CLUB_MEMBERS CASCADE CONSTRAINT;
--DROP TABLE  CLUB_BOARD_COMMENT CASCADE CONSTRAINT;
--DROP TABLE  CLUB_BOARD CASCADE CONSTRAINT;
--DROP TABLE  PREMIUM CASCADE CONSTRAINT;
--DROP TABLE  MEMBER_MSG CASCADE CONSTRAINT;
--DROP TABLE  PREMIUM_ORDER CASCADE CONSTRAINT;
--DROP TABLE  MSG_CATEGORY CASCADE CONSTRAINT;
--DROP TABLE  BOARD_IMG CASCADE CONSTRAINT;
--DROP TABLE  CALENDAR CASCADE CONSTRAINT;
--DROP TABLE  CLUB_BOARDLIST CASCADE CONSTRAINT;
--DROP TABLE  Untitled CASCADE CONSTRAINT;
--DROP TABLE  CLUB_CATEGORY CASCADE CONSTRAINT;
--DROP TABLE  CLUB_HISTORY CASCADE CONSTRAINT;

CREATE TABLE "MEMBER" (
	member_code	NUMBER		NOT NULL,
	member_id	VARCHAR2(30)		NULL,
	member_pwd	VARCHAR2(300)		NULL,
	member_name	VARCHAR2(15)		NULL,
	member_phone	CHAR(13)		NULL,
	member_loc	VARCHAR2(50)		NULL,
	member_email	VARCHAR2(50)		NULL,
	member_birth	DATE		NULL,
	member_gender	CHAR(1)		NULL,
	member_addr	VARCHAR2(100)		NULL,
	member_enrolldate	DATE		NULL,
	member_suspension	CHAR(1)		NULL,
	member_role	VARCHAR2(15)		NULL,
	member_msg	NUMBER		NULL,
	member_like	VARCHAR2(100)		NULL
);

DROP TABLE  BOARD ;

CREATE TABLE  BOARD  (
	 board_no 	NUMBER		NOT NULL,
	 member_code 	NUMBER		NOT NULL,
	 board_cate 	VARCHAR2(20)		NOT NULL,
	 board_title 	VARCHAR2(100)		NULL,
	 board_content 	VARCHAR2(2000)		NULL,
	 board_img_ori 	VARCHAR2(100)		NULL,
	 board_img_re 	VARCHAR2(100)		NULL,
	 board_date 	DATE		NULL,
	 board_readcount 	NUMBER		NULL,
	 board_level 	NUMBER		NULL,
	 board_del 	CHAR(1)		NULL
);

DROP TABLE  BOARD_CATEGORY ;

CREATE TABLE  BOARD_CATEGORY  (
	 board_cate 	VARCHAR2(20)		NOT NULL,
	 board_cateinfo 	CHAR(20)		NULL
);

DROP TABLE  TBL_SEARCH ;

CREATE TABLE  TBL_SEARCH  (
	 search_code 	NUMBER		NOT NULL,
	 search_keyword 	VARCHAR2(100)		NULL,
	 search_date 	DATE		NULL,
	 member_code 	NUMBER		NOT NULL,
	 cate_code 	VARCHAR2(100)		NOT NULL
);

DROP TABLE  BOARD_COMMENT ;

CREATE TABLE  BOARD_COMMENT  (
	 comment_no 	NUMBER		NOT NULL,
	 member_code 	NUMBER		NOT NULL,
	 board_no 	NUMBER		NOT NULL,
	 comment_content 	CHAR(500)		NULL,
	 comment_date 	DATE		NULL,
	 comment_level 	NUMBER		NULL,
	 comment_no_ref 	NUMBER		NOT NULL
);

DROP TABLE  MEMBER_REPORT ;

CREATE TABLE  MEMBER_REPORT  (
	 report_code 	NUMBER		NOT NULL,
	 member_code 	NUMBER		NOT NULL,
	 report_result 	VARCHAR2(300)		NULL,
	 report_reason 	VARCHAR2(300)		NULL,
	 Field 	DATE		NULL,
	 report_start 	DATE		NULL,
	 repost_end 	DATE		NULL
);

DROP TABLE  CONTENTS_INFO ;

CREATE TABLE  CONTENTS_INFO  (
	 contents_code 	NUMBER		NOT NULL,
	 contents_name 	VARCHAR2(100)		NULL,
	 contents_info 	VARCHAR2(2000)		NULL,
	 contents_date 	DATE		NULL,
	 contents_com 	VARCHAR2(100)		NULL,
	 contents_site 	VARCHAR2(300)		NULL,
	 cate_code 	VARCHAR2(100)		NOT NULL
);

DROP TABLE  MEMBER_PROFILE ;

CREATE TABLE  MEMBER_PROFILE  (
	 member_code 	NUMBER		NOT NULL,
	 profile_name 	VARCHAR2(50)		NULL,
	 profile_img_ori 	VARCHAR2(100)		NULL,
	 profile_img_re 	VARCHAR2(100)		NULL,
	 profile_comment 	CHAR(200)		NULL,
	 profile_age 	NUMBER		NULL,
	 profile_gender 	CHAR(1)		NULL,
	 contents_cate_codes 	VARCHAR2(100)		NOT NULL
);

DROP TABLE  MEMBER_EVENT ;

CREATE TABLE  MEMBER_EVENT  (
	 event_code 	NUMBER		NOT NULL,
	 member_code 	NUMBER		NOT NULL,
	 event_date 	DATE		NULL
);

DROP TABLE  CONTENTS_CATEGORY ;

CREATE TABLE  CONTENTS_CATEGORY  (
	 cate_code 	VARCHAR2(100)		NOT NULL,
	 cate_codeinfo 	VARCHAR2(100)		NULL
);

DROP TABLE  EVENT ;

CREATE TABLE  EVENT  (
	 event_code 	NUMBER		NOT NULL,
	 event_title 	VARCHAR2(100)		NULL,
	 event_content 	VARCHAR2(2000)		NULL,
	 event_start 	DATE		NULL,
	 event_end 	DATE		NULL,
	 event_pic 	VARCHAR2(100)		NULL,
	 event_pid 	VARCHAR2(100)		NULL
);

DROP TABLE  CLUB ;

CREATE TABLE  CLUB  (
	 club_code 	NUMBER		NOT NULL,
	 club_master 	NUMBER		NOT NULL,
	 club_title 	CHAR(120)		NULL,
	 club_img_ori 	VARCHAR2(100)		NULL,
	 club_img_re 	VARCHAR2(100)		NULL,
	 club_current 	NUMBER		NULL,
	 club_max 	NUMBER		NULL,
	 club_date 	DATE		NULL,
	 premium_code 	VARCHAR2(30)		NOT NULL
);

DROP TABLE  CONTENTS_IMG ;

CREATE TABLE  CONTENTS_IMG  (
	 img_code 	VARCHAR2(20)		NOT NULL,
	 img_ori 	VARCHAR2(100)		NULL,
	 img_re 	VARCHAR2(100)		NULL
);

DROP TABLE  CLUB_BOARD ;

CREATE TABLE  CLUB_BOARD  (
	 board_no 	NUMBER		NOT NULL,
	 club_code 	NUMBER		NOT NULL,
	 member_code 	NUMBER		NOT NULL,
	 club_boardname 	VARCHAR2(50)		NOT NULL,
	 board_content 	VARCHAR2(2000)		NULL,
	 board_date 	DATE		NULL,
	 board_heart 	NUMBER		NULL,
	 board_cate_code 	VARCHAR2(200)		NULL,
	 board_del 	CHAR(1)		NULL,
	 cate_code 	VARCHAR2(100)		NOT NULL
);

DROP TABLE  CLUB_BOARD_COMMENT ;

CREATE TABLE  CLUB_BOARD_COMMENT  (
	 coment_no 	NUMBER		NOT NULL,
	 board_ref 	NUMBER		NOT NULL,
	 member_code 	NUMBER		NOT NULL,
	 comment_content 	VARCHAR2(500)		NULL,
	 comment_date 	DATE		NULL,
	 coment_level 	NUMBER		NULL,
	 comnet_del 	CHAR(1)		NULL,
	 coment_ref 	NUMBER		NOT NULL
);

DROP TABLE  CLUB_MEMBERS ;

CREATE TABLE  CLUB_MEMBERS  (
	 club_code 	NUMBER		NOT NULL,
	 member_code 	NUMBER		NOT NULL,
	 club_grade 	VARCHAR2(30)		NULL,
	 club_enrolldate 	DATE		NULL
);

DROP TABLE  MEMBER_MSG ;

CREATE TABLE  MEMBER_MSG  (
	 msg_code 	NUMBER		NOT NULL,
	 member_code 	NUMBER		NOT NULL,
	 msg_cate_code 	CHAR(10)		NOT NULL,
	 msg_content 	VARCHAR2(300)		NULL,
	 msg_date 	DATE		NULL,
	 msg_view 	CHAR(1)		NULL,
	 member_from 	NUMBER		NOT NULL
);

DROP TABLE  PREMIUM ;

CREATE TABLE  PREMIUM  (
	 premium_code 	VARCHAR2(30)		NOT NULL,
	 premium_name 	VARCHAR2(50)		NULL,
	 premium_info 	VARCHAR2(50)		NULL,
	 premium_start 	NUMBER		NULL,
	 premium_end 	NUMBER		NULL
);

COMMENT ON COLUMN  PREMIUM . premium_start  IS '단위 : 일';

DROP TABLE  PREMIUM_ORDER ;

CREATE TABLE  PREMIUM_ORDER  (
	 order_code 	NUMBER		NOT NULL,
	 club_code 	NUMBER		NOT NULL,
	 premium_code 	VARCHAR2(30)		NOT NULL,
	 member_code 	NUMBER		NOT NULL,
	 premium_start 	DATE		NULL,
	 premium_end 	DATE		NULL
);

DROP TABLE  MSG_CATEGORY ;

CREATE TABLE  MSG_CATEGORY  (
	 msg_cate_code 	CHAR(10)		NOT NULL,
	 msg_cate_info 	CHAR(100)		NULL
);

DROP TABLE  BOARD_IMG ;

CREATE TABLE  BOARD_IMG  (
	 board_no 	NUMBER		NOT NULL,
	 img_ori 	VARCHAR2(100)		NULL,
	 img_re 	VARCHAR2(100)		NULL
);

DROP TABLE  CALENDAR ;

CREATE TABLE  CALENDAR  (
	 club_code 	NUMBER		NOT NULL,
	 club_master 	NUMBER		NOT NULL,
	 calendar_title 	VARCHAR2(300)		NULL,
	 calendar_start 	DATE		NULL,
	 calendar_end 	DATE		NULL,
	 calendar_content 	VARCJAR2(500)		NULL
);

DROP TABLE  CLUB_BOARDLIST ;

CREATE TABLE  CLUB_BOARDLIST  (
	 club_boardname 	char(30)		NOT NULL,
	 club_code 	NUMBER		NOT NULL,
	 board_name 	char(30)		NULL
);

DROP TABLE  Untitled ;

CREATE TABLE  Untitled  (
	 member_code 	NUMBER		NOT NULL,
	 member_id 	VARCHAR2(30)		NULL,
	 member_pname 	VARCHAR2(50)		NULL
);

DROP TABLE  CLUB_CATEGORY ;

CREATE TABLE  CLUB_CATEGORY  (
	 club_code 	NUMBER		NOT NULL,
	 club_cate 	VARCHAR2(100)		NOT NULL
);

DROP TABLE  CLUB_HISTORY ;

CREATE TABLE  CLUB_HISTORY  (
	 club_code 	NUMBER		NOT NULL,
	 club_count 	NUMBER		NULL,
	 club_boardcnt 	NUMBER		NULL,
	 club_usedate 	DATE		NULL,
	 member_code 	NUMBER		NOT NULL
);

ALTER TABLE  MEMBER  ADD CONSTRAINT  PK_MEMBER  PRIMARY KEY (
	 member_code 
);

ALTER TABLE  BOARD  ADD CONSTRAINT  PK_BOARD  PRIMARY KEY (
	 board_no ,
	 member_code ,
	 board_cate 
);

ALTER TABLE  BOARD_CATEGORY  ADD CONSTRAINT  PK_BOARD_CATEGORY  PRIMARY KEY (
	 board_cate 
);

ALTER TABLE  TBL_SEARCH  ADD CONSTRAINT  PK_TBL_SEARCH  PRIMARY KEY (
	 search_code 
);

ALTER TABLE  BOARD_COMMENT  ADD CONSTRAINT  PK_BOARD_COMMENT  PRIMARY KEY (
	 comment_no ,
	 member_code ,
	 board_no 
);

ALTER TABLE  MEMBER_REPORT  ADD CONSTRAINT  PK_MEMBER_REPORT  PRIMARY KEY (
	 report_code ,
	 member_code 
);

ALTER TABLE  CONTENTS_INFO  ADD CONSTRAINT  PK_CONTENTS_INFO  PRIMARY KEY (
	 contents_code 
);

ALTER TABLE  MEMBER_PROFILE  ADD CONSTRAINT  PK_MEMBER_PROFILE  PRIMARY KEY (
	 member_code 
);

ALTER TABLE  MEMBER_EVENT  ADD CONSTRAINT  PK_MEMBER_EVENT  PRIMARY KEY (
	 event_code ,
	 member_code 
);

ALTER TABLE  CONTENTS_CATEGORY  ADD CONSTRAINT  PK_CONTENTS_CATEGORY  PRIMARY KEY (
	 cate_code 
);

ALTER TABLE  EVENT  ADD CONSTRAINT  PK_EVENT  PRIMARY KEY (
	 event_code 
);

ALTER TABLE  CLUB  ADD CONSTRAINT  PK_CLUB  PRIMARY KEY (
	 club_code ,
	 club_master 
);

ALTER TABLE  CONTENTS_IMG  ADD CONSTRAINT  PK_CONTENTS_IMG  PRIMARY KEY (
	 img_code 
);

ALTER TABLE  CLUB_BOARD  ADD CONSTRAINT  PK_CLUB_BOARD  PRIMARY KEY (
	 board_no ,
	 club_code ,
	 member_code ,
	 club_boardname 
);

ALTER TABLE  CLUB_BOARD_COMMENT  ADD CONSTRAINT  PK_CLUB_BOARD_COMMENT  PRIMARY KEY (
	 coment_no ,
	 board_ref ,
	 member_code 
);

ALTER TABLE  CLUB_MEMBERS  ADD CONSTRAINT  PK_CLUB_MEMBERS  PRIMARY KEY (
	 club_code ,
	 member_code 
);

ALTER TABLE  MEMBER_MSG  ADD CONSTRAINT  PK_MEMBER_MSG  PRIMARY KEY (
	 msg_code ,
	 member_code ,
	 msg_cate_code 
);

ALTER TABLE  PREMIUM  ADD CONSTRAINT  PK_PREMIUM  PRIMARY KEY (
	 premium_code 
);

ALTER TABLE  PREMIUM_ORDER  ADD CONSTRAINT  PK_PREMIUM_ORDER  PRIMARY KEY (
	 order_code ,
	 club_code ,
	 premium_code ,
	 member_code 
);

ALTER TABLE  MSG_CATEGORY  ADD CONSTRAINT  PK_MSG_CATEGORY  PRIMARY KEY (
	 msg_cate_code 
);

ALTER TABLE  BOARD_IMG  ADD CONSTRAINT  PK_BOARD_IMG  PRIMARY KEY (
	 board_no 
);

ALTER TABLE  CALENDAR  ADD CONSTRAINT  PK_CALENDAR  PRIMARY KEY (
	 club_code ,
	 club_master 
);

ALTER TABLE  CLUB_BOARDLIST  ADD CONSTRAINT  PK_CLUB_BOARDLIST  PRIMARY KEY (
	 club_boardname ,
	 club_code 
);

ALTER TABLE  Untitled  ADD CONSTRAINT  PK_UNTITLED  PRIMARY KEY (
	 member_code 
);

ALTER TABLE  CLUB_CATEGORY  ADD CONSTRAINT  PK_CLUB_CATEGORY  PRIMARY KEY (
	 club_code 
);

ALTER TABLE  CLUB_HISTORY  ADD CONSTRAINT  PK_CLUB_HISTORY  PRIMARY KEY (
	 club_code 
);

ALTER TABLE  BOARD  ADD CONSTRAINT  FK_MEMBER_TO_BOARD_1  FOREIGN KEY (
	 member_code 
)
REFERENCES  MEMBER  (
	 member_code 
);

ALTER TABLE  BOARD  ADD CONSTRAINT  FK_BOARD_CATEGORY_TO_BOARD_1  FOREIGN KEY (
	 board_cate 
)
REFERENCES  BOARD_CATEGORY  (
	 board_cate 
);

ALTER TABLE  BOARD_COMMENT  ADD CONSTRAINT  FK_MEMBER_TO_BOARD_COMMENT_1  FOREIGN KEY (
	 member_code 
)
REFERENCES  MEMBER  (
	 member_code 
);

ALTER TABLE  BOARD_COMMENT  ADD CONSTRAINT  FK_BOARD_TO_BOARD_COMMENT_1  FOREIGN KEY (
	 board_no 
)
REFERENCES  BOARD  (
	 board_no 
);

ALTER TABLE  MEMBER_REPORT  ADD CONSTRAINT  FK_MEMBER_TO_MEMBER_REPORT_1  FOREIGN KEY (
	 member_code 
)
REFERENCES  MEMBER  (
	 member_code 
);

ALTER TABLE  MEMBER_PROFILE  ADD CONSTRAINT  FK_MEMBER_TO_MEMBER_PROFILE_1  FOREIGN KEY (
	 member_code 
)
REFERENCES  MEMBER  (
	 member_code 
);

ALTER TABLE  MEMBER_EVENT  ADD CONSTRAINT  FK_EVENT_TO_MEMBER_EVENT_1  FOREIGN KEY (
	 event_code 
)
REFERENCES  EVENT  (
	 event_code 
);

ALTER TABLE  MEMBER_EVENT  ADD CONSTRAINT  FK_MEMBER_TO_MEMBER_EVENT_1  FOREIGN KEY (
	 member_code 
)
REFERENCES  MEMBER  (
	 member_code 
);

ALTER TABLE  CLUB  ADD CONSTRAINT  FK_MEMBER_TO_CLUB_1  FOREIGN KEY (
	 club_master 
)
REFERENCES  MEMBER  (
	 member_code 
);

ALTER TABLE  CONTENTS_IMG  ADD CONSTRAINT  FK_CONTENTS_INFO_TO_CONTENTS_IMG_1  FOREIGN KEY (
	 img_code 
)
REFERENCES  CONTENTS_INFO  (
	 contents_code 
);

ALTER TABLE  CLUB_BOARD  ADD CONSTRAINT  FK_CLUB_TO_CLUB_BOARD_1  FOREIGN KEY (
	 club_code 
)
REFERENCES  CLUB  (
	 club_code 
);

ALTER TABLE  CLUB_BOARD  ADD CONSTRAINT  FK_MEMBER_TO_CLUB_BOARD_1  FOREIGN KEY (
	 member_code 
)
REFERENCES  MEMBER  (
	 member_code 
);

ALTER TABLE  CLUB_BOARD  ADD CONSTRAINT  FK_CLUB_BOARDLIST_TO_CLUB_BOARD_1  FOREIGN KEY (
	 club_boardname 
)
REFERENCES  CLUB_BOARDLIST  (
	 club_boardname 
);

ALTER TABLE  CLUB_BOARD_COMMENT  ADD CONSTRAINT  FK_CLUB_BOARD_TO_CLUB_BOARD_COMMENT_1  FOREIGN KEY (
	 board_ref 
)
REFERENCES  CLUB_BOARD  (
	 board_no 
);

ALTER TABLE  CLUB_BOARD_COMMENT  ADD CONSTRAINT  FK_MEMBER_TO_CLUB_BOARD_COMMENT_1  FOREIGN KEY (
	 member_code 
)
REFERENCES  MEMBER  (
	 member_code 
);

ALTER TABLE  CLUB_MEMBERS  ADD CONSTRAINT  FK_CLUB_TO_CLUB_MEMBERS_1  FOREIGN KEY (
	 club_code 
)
REFERENCES  CLUB  (
	 club_code 
);

ALTER TABLE  CLUB_MEMBERS  ADD CONSTRAINT  FK_MEMBER_PROFILE_TO_CLUB_MEMBERS_1  FOREIGN KEY (
	 member_code 
)
REFERENCES  MEMBER_PROFILE  (
	 member_code 
);

ALTER TABLE  MEMBER_MSG  ADD CONSTRAINT  FK_MEMBER_TO_MEMBER_MSG_1  FOREIGN KEY (
	 member_code 
)
REFERENCES  MEMBER  (
	 member_code 
);

ALTER TABLE  MEMBER_MSG  ADD CONSTRAINT  FK_MSG_CATEGORY_TO_MEMBER_MSG_1  FOREIGN KEY (
	 msg_cate_code 
)
REFERENCES  MSG_CATEGORY  (
	 msg_cate_code 
);

ALTER TABLE  PREMIUM_ORDER  ADD CONSTRAINT  FK_CLUB_TO_PREMIUM_ORDER_1  FOREIGN KEY (
	 club_code 
)
REFERENCES  CLUB  (
	 club_code 
);

ALTER TABLE  PREMIUM_ORDER  ADD CONSTRAINT  FK_PREMIUM_TO_PREMIUM_ORDER_1  FOREIGN KEY (
	 premium_code 
)
REFERENCES  PREMIUM  (
	 premium_code 
);

ALTER TABLE  PREMIUM_ORDER  ADD CONSTRAINT  FK_MEMBER_TO_PREMIUM_ORDER_1  FOREIGN KEY (
	 member_code 
)
REFERENCES  MEMBER  (
	 member_code 
);

ALTER TABLE  BOARD_IMG  ADD CONSTRAINT  FK_CLUB_BOARD_TO_BOARD_IMG_1  FOREIGN KEY (
	 board_no 
)
REFERENCES  CLUB_BOARD  (
	 board_no 
);

ALTER TABLE  CALENDAR  ADD CONSTRAINT  FK_CLUB_TO_CALENDAR_1  FOREIGN KEY (
	 club_code 
)
REFERENCES  CLUB  (
	 club_code 
);

ALTER TABLE  CALENDAR  ADD CONSTRAINT  FK_CLUB_TO_CALENDAR_2  FOREIGN KEY (
	 club_master 
)
REFERENCES  CLUB  (
	 club_master 
);

ALTER TABLE  CLUB_BOARDLIST  ADD CONSTRAINT  FK_CLUB_TO_CLUB_BOARDLIST_1  FOREIGN KEY (
	 club_code 
)
REFERENCES  CLUB  (
	 club_code 
);

ALTER TABLE  Untitled  ADD CONSTRAINT  FK_MEMBER_TO_Untitled_1  FOREIGN KEY (
	 member_code 
)
REFERENCES  MEMBER  (
	 member_code 
);

ALTER TABLE  CLUB_CATEGORY  ADD CONSTRAINT  FK_CLUB_TO_CLUB_CATEGORY_1  FOREIGN KEY (
	 club_code 
)
REFERENCES  CLUB  (
	 club_code 
);

ALTER TABLE  CLUB_HISTORY  ADD CONSTRAINT  FK_CLUB_TO_CLUB_HISTORY_1  FOREIGN KEY (
	 club_code 
)
REFERENCES  CLUB  (
	 club_code 
);

--===================================================================
-- 시퀀스
--===================================================================
create sequence seq_member_no;



--===================================================================
--더미
--===================================================================

insert into member
values(
seq_member_no.nextval,
'admin1234',
'$2a$10$gjA.1nKhR2SNMW8RvdMabuVjrh5cZpoL5aAOUqXoTlbffj1ytQc9i',
'관리자',
NULL,
'경기',
'admin1234@ifwe.com',
to_date('06/20/1990 00:00:00', 'mm/dd/yyyy hh24:mi:ss'),
'M',
'경기 성남시 분당구 대왕판교로606번길 45',
default,
null,'member',0,'공연전시,스터디,음악댄스'
);
commit;
select * from member;
--id : admin1234
--password : admin1234!

