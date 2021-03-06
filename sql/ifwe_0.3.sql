l--================================================
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


----------------------------------------------------------------------
-- 문보라 추가 member, board, club, club_boardlist, CLUB_BOARD_COMMENT,CLUB_BOARD
----------------------------------------------------------------------

CREATE TABLE  CLUB  (
    club_code    NUMBER      NOT NULL,
    club_master    NUMBER      NOT NULL,
    club_title    varCHAR2(120)      NULL,
    club_img_ori    VARCHAR2(100)      NULL,
    club_img_re    VARCHAR2(100)      NULL,
    club_current    NUMBER      NULL,
    club_max    NUMBER      NULL,
    club_date    DATE default sysdate,
    club_content varchar2(300) null,
     club_catecode varchar2(10) null,
     club_location varchar2(10) null,
     premium_code    VARCHAR2(30)    NULL,
     constraint pk_club_code primary key(club_code)
     
);


CREATE TABLE  CLUB_BOARDLIST  (
	 club_boardname 	varchar2(30)		NOT NULL,
	 club_code 	NUMBER		NOT NULL,
	 board_name 	char(30)		NULL,
     constraint pk_club_boardname primary key(club_boardname),
     constraint fk_club_code foreign key (club_code) references club (club_code)ON DELETE CASCADE
);

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


select * from tab;

CREATE TABLE  CLUB_BOARD  (
	 board_no 	NUMBER		NOT NULL primary key ,
	 club_code 	NUMBER		NOT NULL,
	 member_code 	NUMBER		NOT NULL,
	 club_boardname 	VARCHAR2(50)		NOT NULL,
	 board_content 	VARCHAR2(2000)		NULL,
	 board_date 	DATE		NULL,
	 board_heart 	NUMBER		NULL,
	 board_cate_code 	VARCHAR2(200)		NULL,
	 board_del 	CHAR(1)		NULL,
	 cate_code 	VARCHAR2(100)		NOT NULL,
     constraint fk_club_code_board foreign key (club_code) references club (club_code)ON DELETE CASCADE,
     constraint fk_member_code foreign key (member_code) references member (member_code)ON DELETE CASCADE,
     constraint fk_club_boarddname_board foreign key (club_boardname) references CLUB_BOARDLIST (club_boardname)ON DELETE CASCADE
     
);

CREATE TABLE MEMBER (
	member_code	NUMBER		NOT NULL primary key,
	member_id	VARCHAR2(30)		NULL,
	member_pwd	VARCHAR2(300)		NULL,
	member_name	VARCHAR2(15)		NULL,
	member_phone	CHAR(13)		NULL,
	member_loc	VARCHAR2(50)		NULL,
	member_email	VARCHAR2(50)		NULL,
	member_birth	DATE		NULL,
	member_gender	CHAR(1)		NULL,
	member_addr	VARCHAR2(100)		NULL,
	member_enrolldate	DATE    default sysdate,
	member_suspension	CHAR(1)		NULL, -- 징계여부 y or n
	member_role	VARCHAR2(15)		NULL,
	member_msg	NUMBER		NULL,
	member_like	VARCHAR2(100)		NULL
);

----------------------------------------------------------------------


CREATE TABLE MEMBER (
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
	member_enrolldate	DATE    default sysdate,
	member_suspension	CHAR(1)		NULL, -- 징계여부 y or n
	member_role	VARCHAR2(15)		NULL, -- 사용자 분류 'A' 관리자 'M' 일반 회원 'D' 탈퇴한 회원 'H' 휴면 회원
	member_msg	NUMBER		NULL,
	member_like	VARCHAR2(100)		NULL
);



CREATE TABLE  BOARD  (
	 board_no 	NUMBER		NOT NULL,
	 member_code 	NUMBER		NOT NULL,
	 board_cate 	VARCHAR2(20)		NOT NULL,
	 board_title 	VARCHAR2(100)		NULL,
	 board_content 	VARCHAR2(2000)		NULL,
	 board_img_ori 	VARCHAR2(100)		NULL,
	 board_img_re 	VARCHAR2(100)		NULL,
	 board_date 	DATE		default sysdate,
	 board_readcount 	NUMBER	default	0,
	 board_level 	NUMBER		default 0,
	 board_del 	CHAR(1) default 'N' -- 삭제 글 여부 'Y' 'N'
);


CREATE TABLE  BOARD_CATEGORY  (
	 board_cate 	VARCHAR2(50)		NOT NULL,
	 board_cateinfo 	CHAR(20)		NULL
);



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



CREATE TABLE  MEMBER_REPORT  (
	 report_code 	NUMBER		NOT NULL,
	 member_code 	NUMBER		NOT NULL,
	 report_result 	VARCHAR2(300)		NULL,
	 report_reason 	VARCHAR2(300)		NULL,
	 Field 	DATE		NULL,
	 report_start 	DATE		NULL,
	 repost_end 	DATE		NULL
);



CREATE TABLE  CONTENTS_INFO  (
	 contents_code 	NUMBER		NOT NULL,
	 contents_name 	VARCHAR2(100)		NULL,
	 contents_info 	VARCHAR2(2000)		NULL,
	 contents_date 	DATE		NULL,
	 contents_com 	VARCHAR2(100)		NULL,
	 contents_site 	VARCHAR2(300)		NULL,
	 cate_code 	VARCHAR2(100)		NOT NULL
);


	select 
		* 
	from 
		MEMBER_PROFILE
	where member_code=41;




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



CREATE TABLE  CLUB_CATEGORY  (
    club_code    NUMBER      NOT NULL,
    club_cate    VARCHAR2(100)      NOT NULL
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

-- 0323 변경
CREATE TABLE  CLUB  (
    club_code    NUMBER      NOT NULL,
    club_master    NUMBER      NOT NULL,
    club_title    varCHAR2(120)      NULL,
    club_img_ori    VARCHAR2(100)      NULL,
    club_img_re    VARCHAR2(100)      NULL,
    club_current    NUMBER      NULL,
    club_max    NUMBER      NULL,
    club_date    DATE default sysdate,
    club_content varchar2(300) null,
     club_catecode varchar2(12) null,
     club_location varchar2(10) null,
     premium_code    VARCHAR2(30)    NULL
     
);

-- 0323 추가
CREATE TABLE  CONTENTS_CATEGORY  (
    cate_code    VARCHAR2(100)   NOT NULL
);

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
	 premium_duration 	NUMBER		NULL,
	 premium_price 	NUMBER		NULL
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

DROP TABLE  friend;

CREATE TABLE  friend  (
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
--create sequence seq_board_no;
--create sequence seq_club_no;

--===================================================================
--member dummy
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


--=============================================
-- board_cate dummy
--=============================================
insert into board_category values('notice','공지사항');
insert into board_category values('qna','문의사항');
insert into board_category values('report','신고');
commit;
--select * from board_category;
--=============================================
-- board dummy
--=============================================
select * from board;
insert into board values (
    seq_board_no.nextval,
    3,
    'notice',
    'test Title',
    'test Contents',
    null,
    null,
    default,
    default,
    default,
    default    
);
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (45,1,'notice','테스트6','<p>테스트6</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (46,1,'notice','테스트7','<p>테스트7</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (47,1,'notice','테스트8','<p>테스트8</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (48,1,'notice','테스트9','<p>테스트9</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (49,1,'notice','테스트10','<p>테스트10</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (50,1,'notice','테스트11','<p>테스트11</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (51,1,'report','테스트21','<p>테스트21</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (52,1,'report','테스트22','<p>테스트22</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (53,1,'report','테스트23','<p>테스트23</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (54,1,'report','테스트24','<p>테스트24</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (55,1,'report','테스트25','<p>테스트25</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (56,1,'report','테스트26','<p>테스트26</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (57,1,'qna','테스트31','<p>테스트31</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (58,1,'qna','테스트32','<p>테스트32</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (59,1,'qna','테스트33','<p>테스트33</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (60,1,'qna','테스트34','<p>테스트34</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (61,1,'qna','테스트35','<p>테스트35</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (42,1,'notice','공지사항_TEST_1','<p>반갑 습니다 이곳은 IF WE 공지사항 게시판 입니다....</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (43,1,'notice','테스트2','<p>테스트2</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (44,1,'report','테스트5','<p>테스트5</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (21,3,'notice','test Title','test Contents',null,null,to_date('20/03/22','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (41,1,'notice','공지사항_TEST_1','<p>반갑 습니다 이곳은 IF WE 공지사항 게시판 입니다....</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
commit;

select * from friend;


insert into friend
values(
41,'test1','김김김a'

);
commit;

insert into friend
values(
41,'test1','김김김'

);
commit;

commit;