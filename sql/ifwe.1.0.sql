--================================================
--관리자계정 system
--================================================
--ifwe 계정생성
--create user ifwe identified by ifwe
--default tablespace users;
--grant connect, resource to ifwe;
 
--=================================================================
-- ifwe
--=================================================================
--=================================================================
--DROP
--=================================================================
--DROP TABLE  member CASCADE CONSTRAINT;
--DROP TABLE  MEMBER_REPORT CASCADE CONSTRAINT;
--DROP TABLE  BOARD_CATEGORY CASCADE CONSTRAINT;
--DROP TABLE  TBL_SEARCH CASCADE CONSTRAINT;
--DROP TABLE  BOARD_COMMENT CASCADE CONSTRAINT;
--DROP TABLE  CONTENTS_INFO CASCADE CONSTRAINT;
--DROP TABLE  BOARD CASCADE CONSTRAINT;
--DROP TABLE  MEMBER_PROFILE CASCADE CONSTRAINT;
--DROP TABLE  MEMBER_EVENT CASCADE CONSTRAINT;
--DROP TABLE  CONTENTS_CATEGORY CASCADE CONSTRAINT;
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
--DROP TABLE  CLUB_BOARDLIST CASCADE CONSTRAINT;
--DROP TABLE  friend CASCADE CONSTRAINT;
--DROP TABLE  CLUB_CATEGORY CASCADE CONSTRAINT;
--DROP TABLE  CLUB_HISTORY CASCADE CONSTRAINT;
--DROP TABLE  TBL_EVENT CASCADE CONSTRAINT;
--DROP TABLE fullcalendar CASCADE CONSTRAINT;
--DROP TABLE LOGINRECORD CASCADE CONSTRAINT;
--DROP TABLE board_heart_tbl CASCADE CONSTRAINT;
--
--drop sequence seq_member_no;  -- 회원 번호 
--drop sequence seq_board_no;   -- 게시글 번호
--drop sequence seq_board_comment_no; -- 게시글 답변 번호
--drop sequence seq_club_no;    -- 소모임 번호 
--drop sequence seq_msg_code;   -- 메세지 번호
--drop sequence seq_order_code; -- 구매기록 번호
--drop sequence seq_contents_code; -- 컨텐츠 번호
--drop sequence seq_club_board_no;  --클럽게시판번호
--drop sequence seq_club_boardlist_no; --클럽게시판목록번호
--drop sequence seq_search_no; -- 검색용 시퀀스
--drop sequence seq_club_board_comment_no; --클럽게시판댓글번호
--drop sequence seq_loginrecord_no;  -- 로그인 기록 시퀀스
--drop sequence seq_FC_no; -- 소모임 일정 기록 시퀀스
--drop sequence seq_event_no;
--
--drop trigger trig_club_member;
--drop trigger tri_board_level;
--drop trigger tri_board_level_del;
--drop trigger trig_club_boardlist;
--drop trigger club_members_tri;
--drop trigger club_members_tri_mi;
--drop trigger noheart_tri;
--drop trigger heart_tri;
--drop trigger buy_premium_tri;
--drop trigger trig_club_friendMsgg;
--=================================================================
--select
--=================================================================
--select * from tab; -- 전체 테이블 조회
--select * from member;
--select * from member_profile;
--select * from club_members;
--=================================================================
--TABLE
--=================================================================

--  index

-- 1.회원
-- 2.회원 프로필 테이블
-- 3.회원 이벤트 테이블
-- 4.회원 이벤트 참가기록 테이블 - 미사용 테이블
-- 5.회원 신고 기록 테이블 - 미사용 테이블
-- 6.회원 메세지 카테고리 테이블 - 
-- 7.회원 메세지 테이블
-- 8.회원 친구 목록
-- 9.프리미엄 
-- 10.프리미엄 구매 목록 

-- 11.게시판 카테고리
-- 12.게시판 
-- 13.게시판 댓글테이블
-- 14.검색어 기록

-- 15.컨텐츠 카테고리 테이블
-- 16.컨텐츠 정보 테이블
-- 17.컨텐츠 이미지 테이블

-- 18.소모임 테이블
-- 19.소모임 게시판 목록 테이블
-- 20.소모임 게시판 테이블
-- 21.소모임 게시판 댓글 테이블
-- 22.소모임 게시판 이미지 테이블
-- 23.소모임 카테고리 테이블
-- 24.소모임 회원 목록 테이블
-- 25.소모임 방문 기록 테이블
-- 26.소모임 일정정보 저장 테이블
-- 27. 좋아요 기록 테이블
--======================================================================
-- 1.회원
CREATE TABLE MEMBER (
	member_code	NUMBER		primary key,
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
	member_like	VARCHAR2(100)		NULL,
        constraint ck_member_check_gender check(member_gender in('m','f')),
        constraint ck_member_check_suspension check(member_suspension in('y','n'))
);
-- 2.회원 프로필 테이블
CREATE TABLE  MEMBER_PROFILE  (
	 member_code 	NUMBER		NOT NULL,
	 profile_name 	VARCHAR2(50)		NULL,
	 profile_img_ori 	VARCHAR2(200)		NULL,
	 profile_img_re 	VARCHAR2(200)		NULL,
	 profile_comment 	VARCHAR2(200)		NULL,
	 profile_age 	NUMBER		NULL,
	 profile_gender 	CHAR(1)		NULL,
	 contents_cate_codes 	VARCHAR2(100) NULL,
        CONSTRAINT fk_memberProfile_code FOREIGN key(member_code)
                                                REFERENCES member(member_code)                                                    
                                                        on delete cascade
                                                        --on delete set null
);
-- 3.회원 이벤트 테이블 - 0402 update
CREATE TABLE  TBL_EVENT  (
    event_code    NUMBER      primary key, -- 이벤트 생성 코드 시퀀스 사용 예정
    event_title    VARCHAR2(100)      NULL, -- 이벤트 제목
    event_content    VARCHAR2(2000)      NULL, -- 이벤트 내용
    event_start    DATE      NULL, -- 이벤트 시작일
    event_end    DATE      NULL,     -- 이벤트 종료일
     member_code NUMBER NOT NULL,
     event_img_ori varchar2(200) NULL,
     event_img_re varchar2(200) NULL
);
-- 4.회원 이벤트 참가기록 테이블 - 미사용 테이블
-- CREATE TABLE  MEMBER_EVENT  (
-- 	 event_code 	NUMBER		NOT NULL, -- 이벤트 생성코드 참조
-- 	 member_code 	NUMBER		NOT NULL, -- 회원 멤버 코드 참조
-- 	 event_date 	DATE		NULL,    -- 이벤트 참여일
--      CONSTRAINT fk_memberEvent_memberCode foreign key(member_code)
--                                                         REFERENCES member(member_code)                                                    
--                                                         on delete cascade
     
-- );
-- 5.회원 신고 기록 테이블 - 미사용 테이블
CREATE TABLE  MEMBER_REPORT  (
	 report_code 	NUMBER		PRIMARY KEY, -- 신고 번호 - 시퀀스 이용
	 member_code 	NUMBER		NOT NULL, -- 신고한 사람
	 report_result 	VARCHAR2(300)		NULL, -- 신고 처리 결과
	 report_reason 	VARCHAR2(300)		NULL, -- 신고 이유
	 report_day 	DATE		DEFAULT SYSDATE, -- 신고 날짜
	 report_start 	DATE		NULL, -- 징계 시작 날짜
	 repost_end 	DATE		NULL, -- 징계 종료 날짜
          CONSTRAINT fk_memberReport_memberCode foreign key(member_code)
                                                        REFERENCES member(member_code)                                                    
                                                        on delete cascade
);
-- 6.회원 메세지 카테고리 테이블
CREATE TABLE  MSG_CATEGORY  (
	 msg_cate_code 	VARCHAR2(100)   PRIMARY KEY, -- 메세지 카테고리 분류 명. c1-> 소모임 신청
	 msg_cate_info 	VARCHAR2(100)		NULL -- 메세지 카테고리 별 내용 
     
);
--7.회원 메세지 테이블
CREATE TABLE  MEMBER_MSG  (
	 msg_code 	NUMBER		PRIMARY KEY,-- 메세지 생성 코드 시퀀스 
	 member_code 	NUMBER		NOT NULL,-- 수신자 회원 번호
	 msg_cate_code 	VARCHAR2(100),        -- 메세지 카테고리 
	 msg_content 	VARCHAR2(300)		NULL,-- 메세지 내용
	 msg_date 	DATE		default sysdate,          -- 보낸 시간 내용
	 msg_view 	CHAR(1)		default 'n',          -- 메세지 확인 여부          
	 member_from 	NUMBER	 NULL,   -- 보낸 사람 회원 코드 
     club_code number, -- 보낸 소모임 
          CONSTRAINT fk_msg_memberCode foreign key(member_code)
                                                        REFERENCES member(member_code)                                                    
                                                        on delete cascade,
          CONSTRAINT fk_msg_cateCode foreign key(msg_cate_code)
                                                        REFERENCES MSG_CATEGORY(msg_cate_code)                                                    
                                                        on delete cascade,
          constraint ck_msg_msgView check(msg_view in ('y','n'))--member-from fk
);
-- 8.회원 친구 목록
CREATE TABLE  friend  (
	 member_code 	NUMBER		NOT NULL, -- 회원 코드
	 member_id 	VARCHAR2(50)		NULL, -- 친구 등록된 회원의 아이디
	 member_pname 	VARCHAR2(50)		NULL, -- 친구 등록된 회원의 프로필 명
     FRIEND_CODE number,
            CONSTRAINT fk_friend_memberCode foreign key(member_code)
                                                      REFERENCES member(member_code)                                                    
                                                      on delete cascade
);
-- 9.프리미엄 
-- CREATE TABLE  PREMIUM  (
-- 	 premium_code 	VARCHAR2(30)		primary key, -- 프리미엄 코드
-- 	 premium_name 	VARCHAR2(50)		NULL, -- 프리미엄 명
-- 	 premium_info 	VARCHAR2(200)		NULL,  -- 프리미엄 설명
-- 	 premium_price 	NUMBER		NULL -- 프리미엄 가격
-- );
-- 10.프리미엄 구매 목록 
CREATE TABLE  PREMIUM_ORDER  (
	 order_code 	NUMBER		primary key, -- 주문 번호
	 club_code 	NUMBER		NOT NULL, -- 구매한 소모임
	 premium_code 	VARCHAR2(30)		NOT NULL, -- 프리미엄 코드
	 member_code 	NUMBER		NOT NULL -- 구매한 소모임 마스터 회원코드
     -- 소모임 프리미엄 구매가격 넣을지말지는 구매기록 확인 구현시 
);
-- 11.게시판 카테고리
CREATE TABLE  BOARD_CATEGORY  (
	 board_cate 	VARCHAR2(100)		PRIMARY KEY,
	 board_cateinfo 	VARCHAR2(100)		NULL
);

-- 12.게시판 
CREATE TABLE  BOARD  (
	 board_no 	NUMBER		PRIMARY key, -- 게시글 번호 시퀀스
	 member_code 	NUMBER		NOT NULL, -- 작성자 회원 번호
	 board_cate 	VARCHAR2(100)		NOT NULL, -- 게시글 카테고리  notice, qna, report, event
	 board_title 	VARCHAR2(100)		NULL, -- 글 제목
	 board_content 	VARCHAR2(2000)		NULL, -- 글 내용
	 board_img_ori 	VARCHAR2(100)		NULL, -- 글 대표이미지 기존이름
	 board_img_re 	VARCHAR2(100)		NULL, -- 글 대표이미지 변경된 이름
	 board_date 	DATE		default sysdate, --  작성 날짜
	 board_readcount 	NUMBER	default	0, -- 조회수
	 board_level 	NUMBER		default 0, -- 게시글 계층 레벨
	 board_del 	CHAR(1) default 'N' -- 삭제 글 여부 'Y' 'N'
     -- 작성자 회원 번호 fk
     -- 카테고리 코드 fk
     -- 삭제 여부 check
);
-- 13.게시판 댓글테이블 --
CREATE TABLE  BOARD_COMMENT  (
    comment_no    NUMBER      PRIMARY key,
    member_code    NUMBER      NOT NULL,
    board_no    NUMBER      NOT NULL,
    comment_content    VARCHAR2(500)      NULL,
    comment_date    DATE      NULL,
    comment_level    NUMBER      NULL,
    comment_no_ref    NUMBER      NULL
);

-- 14.검색어 기록
CREATE TABLE  TBL_SEARCH  (
	 search_code 	NUMBER		PRIMARY KEY, -- 검색 넘버링 시퀀스
	 search_keyword 	VARCHAR2(100)		NULL, -- 검색어
	 search_date 	DATE		default sysdate, -- 검색날짜
	 member_code 	NUMBER		NOT NULL-- 검색한 회원 번호 --pk
);


-- 15.컨텐츠 카테고리 테이블 -- 검색어 자동완성
CREATE TABLE  CONTENTS_CATEGORY  (
    cate_code    VARCHAR2(100)   PRIMARY KEY
);

-- 16.컨텐츠 정보 테이블
-- CREATE TABLE  CONTENTS_INFO  (
-- 	 contents_code 	NUMBER		PRIMARY KEY, -- 시퀀스 (만들것)
-- 	 contents_name 	VARCHAR2(100)		NULL,
-- 	 contents_info 	VARCHAR2(2000)		NULL,
-- 	 contents_date 	DATE		default sysdate, 
-- 	 contents_site 	VARCHAR2(300)		NULL,
-- 	 cate_code 	VARCHAR2(100)		NOT NULL
-- );

-- 17.컨텐츠 이미지 테이블
CREATE TABLE  CONTENTS_IMG  (
	 contents_code 	 VARCHAR2(100)		NOT NULL, -- 컨텐츠 정보 테이블의 PK를 참조함.
	 img_ori 	VARCHAR2(100)		NULL,
	 img_re 	VARCHAR2(100)		NULL
);

-- 18.소모임 테이블
CREATE TABLE  CLUB  (
    club_code    NUMBER      NOT NULL, -- 시퀀스
    club_master    NUMBER      NOT NULL,
    club_title    VARCHAR2(120)      NULL,
    club_img_ori    VARCHAR2(100)      NULL,
    club_img_re    VARCHAR2(100)      NULL,
    club_current    NUMBER      NULL,
    club_max    NUMBER      NULL,
    club_date    DATE default sysdate,
    club_content varchar2(300) null,
    club_catecode varchar2(100) null,
    club_location varchar2(100) null,
    premium_code    VARCHAR2(50)    NULL,
    constraint pk_club_code primary key(club_code)
    
);
-- 19.소모임 게시판 목록 테이블
CREATE TABLE  CLUB_BOARDLIST  (

    club_boardlist_no    number   NOT NULL,
    club_code    NUMBER      NOT NULL,
    board_name    VARCHAR2(50)      NULL,
     constraint pk_club_boardlist_no primary key(club_boardlist_no),
     constraint fk_club_code foreign key (club_code) references club (club_code)ON DELETE CASCADE
);

-- 20.소모임 게시판 테이블
CREATE TABLE  CLUB_BOARD  (
    board_no    NUMBER      primary key ,
    club_code    NUMBER      NOT NULL,
    member_code    NUMBER      NOT NULL,
    club_boardlist_no    number   NOT NULL,
    board_title varchar2(100) null,
    board_content    VARCHAR2(2000)      NULL,
    board_date    DATE   default sysdate,
    board_heart    NUMBER      NULL,
    board_cate_code    VARCHAR2(200)      NULL,
    board_del    CHAR(1)      NULL, -- y or n
    board_report char(1) null , --y or n
    board_imgyn char(1) default 'n',
    board_comment_yn char(1) default 'n',
     constraint fk_club_code_board foreign key (club_code) references club (club_code)ON DELETE CASCADE,
     constraint fk_member_code foreign key (member_code) references member (member_code)ON DELETE CASCADE,
     constraint fk_club_boardlist_no foreign key (club_boardlist_no) references CLUB_BOARDLIST (club_boardlist_no)ON DELETE CASCADE
     
);


-- 21.소모임 게시판 댓글 테이블
CREATE TABLE  CLUB_BOARD_COMMENT  (
    coment_no    NUMBER      NOT NULL, -- 댓글 시퀀스 or 게시판 시퀀스 
    board_ref    NUMBER      NOT NULL, -- 댓글이 달린 원 게시물 번호
    member_code    NUMBER      NOT NULL,
    comment_content    VARCHAR2(500)      NULL,
    comment_date    DATE default sysdate,
    comment_del    CHAR(1)      NULL,
     comment_report char(1) null  --y or n
);


-- 22.소모임 게시판 이미지 테이블
CREATE TABLE  BOARD_IMG  (
	 board_no 	NUMBER		NOT NULL, -- 소모임 게시글의 번호를 참조함.
	 img_ori 	VARCHAR2(100)		NULL,
	 img_re 	VARCHAR2(100)		NULL
);




-- 23.소모임 카테고리 테이블
CREATE TABLE  CLUB_CATEGORY  (
    club_code    NUMBER      NOT NULL, -- 소모임의 소모임코드를 참조함 FK
    club_cate    VARCHAR2(100)      NOT NULL -- 컨텐츠 카테고리 테이블의 컨텐츠 코드를 참조함 FK
);
-- 24.소모임 회원 목록 테이블
CREATE TABLE  CLUB_MEMBERS  (
	 club_code 	NUMBER		NOT NULL, -- 소모임 코드
	 member_code 	NUMBER		NOT NULL, -- 소모임 가입한 회원 코드
	 club_grade 	VARCHAR2(30)		NULL, -- 소모임을 가입한 회원의 등급 준회원 정회원 마스터
	 club_enrolldate 	DATE default sysdate -- 소모임 가입일
     -- club_Code fk
     -- member_code fk
);
-- 25.소모임 방문 기록 테이블 
-- CREATE TABLE  CLUB_HISTORY  (
-- 	 club_code 	NUMBER		NOT NULL,
-- 	 club_count 	NUMBER		NULL,
-- 	 club_boardcnt 	NUMBER		NULL,
-- 	 club_usedate 	DATE		default sysdate,
-- 	 member_code 	NUMBER		NOT NULL
-- );
-- 26.소모임 일정정보 저장 테이블
CREATE TABLE fullcalendar (
    full_id varchar(300)  null,
    title varchar(400) not null,
    full_start DATE null,
    full_end DATE null,
    full_description varchar2(300) null,
    full_type varchar2(200) null,
    full_username varchar2(200) null,
    full_backgroundColor varchar2(200) null,
    full_textColor varchar2(200) null,
    full_allDay varchar2(200) null,
    full_No number not null,
    clubCode number not null
);

-- 27. 좋아요 기록 테이블
create table board_heart_tbl(
    board_no number,
    member_code number,
    constraint fk_heart_board_no foreign key (board_no) references club_board (board_no)ON DELETE CASCADE,
    constraint fk_heart_member_code foreign key (member_code) references member (member_code)ON DELETE CASCADE
);

-- 28. 회원 로그인 기록 테이블
CREATE TABLE LOGINRECORD (

   loginrecord_no  number not null,
   member_code   NUMBER      NOT NULL,
   loginrecord_lastlogin   DATE      NULL,
   loginrecord_logout   CHAR(1)      NULL
);





--=================================================================
--SEQUENCE
--=================================================================
create sequence seq_member_no start with 200;  -- 회원 번호 
create sequence seq_board_no start with 200;   -- 게시글 번호
create sequence seq_board_comment_no start with 200; -- 게시글 답변 번호
create sequence seq_club_no start with 200;    -- 소모임 번호 
create sequence seq_msg_code start with 200;   -- 메세지 번호
create sequence seq_order_code start with 200; -- 구매기록 번호
create sequence seq_contents_code start with 200; -- 컨텐츠 번호
create sequence seq_club_board_no start with 200;  --클럽게시판번호
create sequence seq_club_boardlist_no start with 200; --클럽게시판목록번호
create sequence seq_search_no start with 200; -- 검색용 시퀀스
create sequence seq_club_board_comment_no start with 200; --클럽게시판댓글번호
create sequence seq_loginrecord_no start with 200;  -- 로그인 기록 시퀀스
create sequence seq_FC_no start with 200; -- 소모임 일정용 시퀀스
create sequence seq_event_no start with 200; -- 이벤트 등록 시퀀스


REM INSERTING into IFWE.MEMBER
SET DEFINE OFF;
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (1,'test001','$2a$10$xwlTSAmg/pR8ZbeLCT3q3uGPo.7I1WOUE1wGiKxKjZ90Hs62w4waC','동준백',null,'경기','test1@ifwe.com',to_date('99/11/22','RR/MM/DD'),'m','경기 성남시 분당구 판교동 649',to_date('20/04/10','RR/MM/DD'),null,'member',0,'공연전시');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (2,'test002','$2a$10$J0RMi39sPkfjccSkYVgJEOIbq/he2XXiMY/pjqTSLF6a7wC6wAIhS','형철신',null,'경기','test002@ifwe.com',to_date('99/11/22','RR/MM/DD'),'m','경기 성남시 분당구 판교동 649',to_date('20/04/10','RR/MM/DD'),null,'member',0,'스터디');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (3,'test003','$2a$10$x2YaQ/fRsSRJGh4oj2COVuS5SxM2KLblQpAL83RKHVpAajZny1Sta','진상정',null,'경기','test@ifwe.com',to_date('95/11/22','RR/MM/DD'),'m','경기 성남시 분당구 판교동 649',to_date('20/04/10','RR/MM/DD'),null,'member',0,'음악댄스');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (4,'test004','$2a$10$JDdcKvmVmGQrxzrrmKjU2.Fd19idqnRUvXnGhX8xscB2tXvboG9Rq','원재김',null,'경기','test@ifwe.com',to_date('90/11/22','RR/MM/DD'),'m','경기 성남시 분당구 판교동 649',to_date('20/04/10','RR/MM/DD'),null,'member',0,'스터디');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (5,'test005','$2a$10$btxtqQHmv3ZSU.xh0JAPE.BswIhr8OXmi/OBUGKJOTOUskFGRKMoq','여주장',null,'경기','test@ifwe.com',to_date('00/12/11','RR/MM/DD'),'f','경기 성남시 분당구 판교동 649',to_date('20/04/10','RR/MM/DD'),null,'member',0,'음악댄스');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (6,'test006','$2a$10$iXx6FT4Wao6TbP3j3WJj0Og.6EnnITN2Z8.P6PStZVinHebYqUtVy','보라문',null,'경기','test@ifwe.com',to_date('99/12/11','RR/MM/DD'),'f','경기 성남시 분당구 판교동 649',to_date('20/04/11','RR/MM/DD'),null,'member',0,'공연전시');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (7,'test111','$2a$10$55yin6A/Xv3/Sdy6W4hBiOs11qNvmNpbDkYhpYfbeobklEP804a1y','가나',null,'경기','test@ifwe.com',to_date('99/11/22','RR/MM/DD'),'m','경기 성남시 분당구 판교동 649',to_date('20/04/11','RR/MM/DD'),null,'h',0,'음악댄스');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (8,'test112','$2a$10$qSg/notECg4.c.xSAKvrX.Xp/6dKj9DaOJQaRXZkqQq1faztOph8e','가나다',null,'경기','test@ifwe.com',to_date('99/11/22','RR/MM/DD'),'f','경기 성남시 분당구 판교동 649',to_date('20/04/11','RR/MM/DD'),null,'member',0,'음악댄스');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (9,'test113','$2a$10$KOUOMlihQD5jdN.kJZhYaOPmEm3LW6pvfqm0Et5Xj/ddO.fIv3mW2','가나허',null,'서울','test@ifwe.com',to_date('99/02/22','RR/MM/DD'),'m','서울 광진구 자양동 158-17',to_date('20/04/13','RR/MM/DD'),null,'member',0,'스터디');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (10,'test114','$2a$10$JIbb7htD6wKSMzUGFBt.iup6/3gQP4jfQsaougDS7hXqx33Our2Aa','나나',null,'서울','test@ifwe.com',to_date('99/11/23','RR/MM/DD'),'f','서울 강남구 도곡동 953-11',to_date('20/04/13','RR/MM/DD'),null,'member',0,'공연전시');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (11,'test115','$2a$10$nEVruwxz7RpW1LufY1iW4OA9xvTLNffiifTj/QfJ5A5ncLU2srXb.','나나가',null,'서울','test@ifwe.com',to_date('99/11/22','RR/MM/DD'),'f','서울 강남구 도곡동 953-11',to_date('20/04/13','RR/MM/DD'),null,'member',0,'음악댄스');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (12,'test222','$2a$10$0mzOkbUZCDa.IfkKh.WAUeF7SBKZlmXEonhylgkMEFeoFJSyc.bHm','다다다',null,'서울','test@ifwe.com',to_date('93/11/12','RR/MM/DD'),'m','서울 강남구 도곡동 953-11',to_date('20/04/14','RR/MM/DD'),null,'member',0,'스터디');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (13,'test221','$2a$10$o2i3OXBDT/pnBzX.kPaNquAzDZH9mcHyN9oCoDdwHVnz1uspTEvDi','가나다라',null,'서울','test@ifwe.com',to_date('97/11/11','RR/MM/DD'),'f','서울 강남구 도곡동 953-11',to_date('20/04/15','RR/MM/DD'),null,'member',0,'음악댄스');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (14,'test223','$2a$10$ZKdb5v3h2n2g3ZRSacUp3eZqqq9d2VpnbyuRQLXyXqsjpD2rtwdxO','나나다',null,'서울','test@ifwe.com',to_date('99/11/12','RR/MM/DD'),'f','서울 강남구 도곡동 953-11',to_date('20/04/18','RR/MM/DD'),null,'member',0,'공연전시');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (15,'test224','$2a$10$K3Lml7K6SC4q3oHCccPC..hschD/nGyDdBtGSWSGlfGaacHb0V/Vq','바바가',null,'서울','test@ifwe.com',to_date('99/12/11','RR/MM/DD'),'m','서울 강남구 도곡동 953-11',to_date('20/04/18','RR/MM/DD'),null,'member',0,'스터디');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (16,'test225','$2a$10$T1GIPwXIXlMTkOvhW7Q1fu0sGszmtwz3gs2JcPGyouhj/1Uc.gO3C','바바라',null,'서울','test@ifwe.com',to_date('98/11/12','RR/MM/DD'),'m','서울 강남구 도곡동 953-11',to_date('20/04/18','RR/MM/DD'),null,'member',0,'스터디');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (17,'test226','$2a$10$z.XgfADJnVSrGKjxfmhMQ.XblDLbczhve2XoWDQYEkvLY2U1e3zmq','가나거',null,'서울','test@ifwe.com',to_date('99/11/12','RR/MM/DD'),'m','서울 강남구 도곡동 953-11',to_date('20/04/15','RR/MM/DD'),null,'member',0,'음악댄스');
Insert into IFWE.MEMBER (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_LOC,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_GENDER,MEMBER_ADDR,MEMBER_ENROLLDATE,MEMBER_SUSPENSION,MEMBER_ROLE,MEMBER_MSG,MEMBER_LIKE) values (10000,'admin1234','$2a$10$gjA.1nKhR2SNMW8RvdMabuVjrh5cZpoL5aAOUqXoTlbffj1ytQc9i','관리자',null,'경기','admin123@ifwe.com',to_date('90/06/20','RR/MM/DD'),'m','경기 성남시 분당구 대왕판교로606번길 45',to_date('20/03/28','RR/MM/DD'),null,'member',0,'스터디');
REM INSERTING into IFWE.MEMBER_PROFILE
SET DEFINE OFF;
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (1,'동준','dongjun.jpg','20200410_173042175_334.jpg','내가 백동준이다!',20,'m','이프위,파이널,성공적');
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (2,'어림없지','hyungchul.jpg','20200410_174429448_520.jpg','안녕하세요 잘부탁드립니다~!',20,'m','뮤지컬,영화');
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (3,'아무거나','jinsang.jpg','20200410_175022470_7.jpg','쉿~!',24,'m','쉿,조용히좀해,백동준씨');
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (4,'큐티쁘띠','wonjae.jpg','20200410_175554551_849.jpg','허허허허허허허허허',29,'m','하하,야야,후후');
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (5,'퍄햐햐햐햐','yeoju.jpg','20200410_180040107_939.jpg','프로필소개글',19,'m','퍄햐햐,하하');
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (6,'문크리스탈','bora.jpg','20200410_180738549_692.jpg','프로필소개글',20,'m','세일러문');
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (7,'김치볶음밥','profileImg02.jpg','20200410_181030398_559.jpg','나는 프로필이다',20,'m','김치');
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (8,'모가문제죠','profileImg01.jpg','20200410_181334156_257.jpg','나는 프로필이다',20,'f',null);
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (9,'세종대왕짱','profileImg04.jpg','20200410_181853278_484.jpg','나는 프로필이다',21,'m',null);
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (10,'흥칫뿡','profileImg21.jpg','20200410_183204245_178.jpg','나는 프로필이다',20,'f',null);
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (11,'썬칩','profileImg06.jpg','20200410_183620700_972.jpg','나는 프로필이다',20,'f',null);
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (12,'컴퓨터모니터','profileImg13.jpg','20200410_184834178_860.jpg','나는 프로필이다',26,'m',null);
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (13,'핫도그','profileImg16.jpg','20200410_185041466_741.jpg','나는 프로필이다',22,'f',null);
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (14,'됴됴됴됴됴','profileImg18.jpg','20200410_185218562_695.jpg','나는 프로필이다',20,'f',null);
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (15,'허거걱','profileImg11.jpg','20200410_185539293_571.jpg','나는 프로필이다',20,'m',null);
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (16,'호다다닥','profileImg27.jpg','20200410_185757088_652.jpg','나는 프로필이다',21,'m',null);
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (17,'키보드워리어','profileImg17.jpg','20200410_190002608_582.jpg','나는 프로필이다',20,'m',null);
Insert into IFWE.MEMBER_PROFILE (MEMBER_CODE,PROFILE_NAME,PROFILE_IMG_ORI,PROFILE_IMG_RE,PROFILE_COMMENT,PROFILE_AGE,PROFILE_GENDER,CONTENTS_CATE_CODES) values (10000,'이프위관리자','profileImg26.jpg','20200410_174523707_476.jpg',null,0,'m','프로젝트');

--REM INSERTING into IFWE.BOARD_CATEGORY
SET DEFINE OFF;
Insert into IFWE.BOARD_CATEGORY (BOARD_CATE,BOARD_CATEINFO) values ('notice','공지사항');
Insert into IFWE.BOARD_CATEGORY (BOARD_CATE,BOARD_CATEINFO) values ('qna','문의사항');
Insert into IFWE.BOARD_CATEGORY (BOARD_CATE,BOARD_CATEINFO) values ('report','신고');
REM INSERTING into IFWE.MSG_CATEGORY
SET DEFINE OFF;
Insert into IFWE.MSG_CATEGORY (MSG_CATE_CODE,MSG_CATE_INFO) values ('c1','가입신청');
Insert into IFWE.MSG_CATEGORY (MSG_CATE_CODE,MSG_CATE_INFO) values ('f1','친구신청');
Insert into IFWE.MSG_CATEGORY (MSG_CATE_CODE,MSG_CATE_INFO) values ('m1','메세지');
--REM INSERTING into IFWE.BOARD
SET DEFINE OFF;
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (1,1,'notice','테스트6','<p>테스트6</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (2,1,'notice','테스트7','<p>테스트7</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (3,1,'notice','테스트8','<p>테스트8</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (4,1,'notice','테스트9','<p>테스트9</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (5,1,'notice','테스트10','<p>테스트10</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (6,1,'notice','테스트11','<p>테스트11</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (7,1,'report','테스트21','<p>테스트21</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (8,1,'report','테스트22','<p>테스트22</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (9,1,'report','테스트23','<p>테스트23</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (10,1,'report','테스트24','<p>테스트24</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (11,1,'report','테스트25','<p>테스트25</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (12,1,'report','테스트26','<p>테스트26</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (13,1,'qna','테스트31','<p>테스트31</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (14,1,'qna','테스트32','<p>테스트32</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (15,1,'qna','테스트33','<p>테스트33</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (16,1,'qna','테스트34','<p>테스트34</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (17,1,'qna','테스트35','<p>테스트35</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (18,1,'notice','공지사항_TEST_1','<p>반갑 습니다 이곳은 IF WE 공지사항 게시판 입니다....</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (19,1,'notice','테스트2','<p>테스트2</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (20,1,'report','테스트5','<p>테스트5</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (21,3,'notice','test Title','test Contents',null,null,to_date('20/03/22','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (22,1,'notice','공지사항_TEST_1','<p>반갑 습니다 이곳은 IF WE 공지사항 게시판 입니다....</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');

--REM INSERTING into IFWE.BOARD_COMMENT
SET DEFINE OFF;
--REM INSERTING into IFWE.BOARD_HEART_TBL
SET DEFINE OFF;
--REM INSERTING into IFWE.CLUB
SET DEFINE OFF;
Insert into IFWE.CLUB (CLUB_CODE,CLUB_MASTER,CLUB_TITLE,CLUB_IMG_ORI,CLUB_IMG_RE,CLUB_CURRENT,CLUB_MAX,CLUB_DATE,CLUB_CONTENT,CLUB_CATECODE,CLUB_LOCATION,PREMIUM_CODE) values (1,1,'뮤지컬함께보기','clubbg11.jpg','20200410_173243195_85.jpg',12,100,to_date('20/04/10','RR/MM/DD'),'저희와 뮤지컬 공연 함께 보러가실분들 ~!!','공연전시','서울',null);
Insert into IFWE.CLUB (CLUB_CODE,CLUB_MASTER,CLUB_TITLE,CLUB_IMG_ORI,CLUB_IMG_RE,CLUB_CURRENT,CLUB_MAX,CLUB_DATE,CLUB_CONTENT,CLUB_CATECODE,CLUB_LOCATION,PREMIUM_CODE) values (2,2,'함께하면즐거워요','clubbg05.jpg','20200410_174703120_878.jpg',9,100,to_date('20/04/10','RR/MM/DD'),'함께하면 즐거운 문화생활을 즐기러~!','공연전시','서울',null);
Insert into IFWE.CLUB (CLUB_CODE,CLUB_MASTER,CLUB_TITLE,CLUB_IMG_ORI,CLUB_IMG_RE,CLUB_CURRENT,CLUB_MAX,CLUB_DATE,CLUB_CONTENT,CLUB_CATECODE,CLUB_LOCATION,PREMIUM_CODE) values (3,3,'쉘위댄스','clubbg24.jpg','20200410_175118690_319.jpg',5,100,to_date('20/04/10','RR/MM/DD'),'저와함께춤을','음악댄스','경기',null);
Insert into IFWE.CLUB (CLUB_CODE,CLUB_MASTER,CLUB_TITLE,CLUB_IMG_ORI,CLUB_IMG_RE,CLUB_CURRENT,CLUB_MAX,CLUB_DATE,CLUB_CONTENT,CLUB_CATECODE,CLUB_LOCATION,PREMIUM_CODE) values (4,4,'공부?어렵지않아요','priscilla-du-preez-XkKCui44iM0-unsplash.jpg','20200410_175652898_63.jpg',6,100,to_date('20/04/10','RR/MM/DD'),'저희와한다면 할수있어요','스터디','경기',null);
Insert into IFWE.CLUB (CLUB_CODE,CLUB_MASTER,CLUB_TITLE,CLUB_IMG_ORI,CLUB_IMG_RE,CLUB_CURRENT,CLUB_MAX,CLUB_DATE,CLUB_CONTENT,CLUB_CATECODE,CLUB_LOCATION,PREMIUM_CODE) values (5,5,'야!너두','engStudy.jpg','20200410_180401352_256.jpg',4,100,to_date('20/04/10','RR/MM/DD'),'야 너두 할수있어','공연전시','강원',null);
Insert into IFWE.CLUB (CLUB_CODE,CLUB_MASTER,CLUB_TITLE,CLUB_IMG_ORI,CLUB_IMG_RE,CLUB_CURRENT,CLUB_MAX,CLUB_DATE,CLUB_CONTENT,CLUB_CATECODE,CLUB_LOCATION,PREMIUM_CODE) values (14,14,'춤을춰요','clubbg04.jpg','20200410_185246020_914.jpg',1,100,to_date('20/04/10','RR/MM/DD'),'춤','공연전시','경기',null);
Insert into IFWE.CLUB (CLUB_CODE,CLUB_MASTER,CLUB_TITLE,CLUB_IMG_ORI,CLUB_IMG_RE,CLUB_CURRENT,CLUB_MAX,CLUB_DATE,CLUB_CONTENT,CLUB_CATECODE,CLUB_LOCATION,PREMIUM_CODE) values (15,15,'공연','clubbg21.jpg','20200410_185652630_491.jpg',1,100,to_date('20/04/10','RR/MM/DD'),'공연','공연전시','경기',null);
Insert into IFWE.CLUB (CLUB_CODE,CLUB_MASTER,CLUB_TITLE,CLUB_IMG_ORI,CLUB_IMG_RE,CLUB_CURRENT,CLUB_MAX,CLUB_DATE,CLUB_CONTENT,CLUB_CATECODE,CLUB_LOCATION,PREMIUM_CODE) values (16,16,'음악','clubbg16.jpg','20200410_185823982_127.jpg',1,100,to_date('20/04/10','RR/MM/DD'),'댄스','음악댄스','서울',null);
Insert into IFWE.CLUB (CLUB_CODE,CLUB_MASTER,CLUB_TITLE,CLUB_IMG_ORI,CLUB_IMG_RE,CLUB_CURRENT,CLUB_MAX,CLUB_DATE,CLUB_CONTENT,CLUB_CATECODE,CLUB_LOCATION,PREMIUM_CODE) values (17,17,'공부','clubbg26.jpg','20200410_190032857_18.jpg',1,100,to_date('20/04/10','RR/MM/DD'),'공부','스터디','서울',null);
Insert into IFWE.CLUB (CLUB_CODE,CLUB_MASTER,CLUB_TITLE,CLUB_IMG_ORI,CLUB_IMG_RE,CLUB_CURRENT,CLUB_MAX,CLUB_DATE,CLUB_CONTENT,CLUB_CATECODE,CLUB_LOCATION,PREMIUM_CODE) values (11,6,'우아하게','clubbg06.jpg','20200410_184330266_263.jpg',1,100,to_date('20/04/10','RR/MM/DD'),'우아하게','음악댄스','경기',null);
Insert into IFWE.CLUB (CLUB_CODE,CLUB_MASTER,CLUB_TITLE,CLUB_IMG_ORI,CLUB_IMG_RE,CLUB_CURRENT,CLUB_MAX,CLUB_DATE,CLUB_CONTENT,CLUB_CATECODE,CLUB_LOCATION,PREMIUM_CODE) values (12,12,'공연','clubbg22.jpg','20200410_184908998_454.jpg',1,100,to_date('20/04/10','RR/MM/DD'),'공연','공연전시','서울',null);
Insert into IFWE.CLUB (CLUB_CODE,CLUB_MASTER,CLUB_TITLE,CLUB_IMG_ORI,CLUB_IMG_RE,CLUB_CURRENT,CLUB_MAX,CLUB_DATE,CLUB_CONTENT,CLUB_CATECODE,CLUB_LOCATION,PREMIUM_CODE) values (13,13,'스터디모임','clubbg20.jpg','20200410_185107052_392.jpg',1,100,to_date('20/04/10','RR/MM/DD'),'스터디','공연전시','서울',null);
--REM INSERTING into IFWE.CLUB_BOARDLIST
SET DEFINE OFF;
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (1,1,'공지사항');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (2,1,'자유게시판');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (3,2,'공지사항');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (4,2,'자유게시판');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (5,3,'공지사항');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (6,3,'자유게시판');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (7,4,'공지사항');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (8,4,'자유게시판');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (9,5,'공지사항');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (10,5,'자유게시판');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (24,12,'자유게시판');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (25,13,'공지사항');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (26,13,'자유게시판');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (27,14,'공지사항');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (28,14,'자유게시판');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (29,15,'공지사항');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (30,15,'자유게시판');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (31,16,'공지사항');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (32,16,'자유게시판');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (33,17,'공지사항');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (21,11,'공지사항');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (22,11,'자유게시판');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (23,12,'공지사항');
Insert into IFWE.CLUB_BOARDLIST (CLUB_BOARDLIST_NO,CLUB_CODE,BOARD_NAME) values (34,17,'자유게시판');
--REM INSERTING into IFWE.CLUB_MEMBERS
SET DEFINE OFF;
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (1,1,'master',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (2,2,'master',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (1,2,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (3,3,'master',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (1,3,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (2,3,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (4,4,'master',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (1,4,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (1,5,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (2,5,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (3,5,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (4,5,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (5,5,'master',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (1,6,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (2,6,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (3,6,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (4,6,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (5,6,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (6,7,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (1,7,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (2,7,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (5,7,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (4,7,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (7,8,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (1,8,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (2,8,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (3,8,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (4,8,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (5,8,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (6,8,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (8,9,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (1,9,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (2,9,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (3,9,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (9,10,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (1,10,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (2,10,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (4,10,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (10,11,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (1,11,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (2,11,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (11,6,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (12,12,'master',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (13,13,'master',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (14,14,'master',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (15,15,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (1,15,'member',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (16,16,'master',to_date('20/04/10','RR/MM/DD'));
Insert into IFWE.CLUB_MEMBERS (CLUB_CODE,MEMBER_CODE,CLUB_GRADE,CLUB_ENROLLDATE) values (17,17,'master',to_date('20/04/10','RR/MM/DD'));
--REM INSERTING into IFWE.CLUB_BOARD
SET DEFINE OFF;
Insert into IFWE.CLUB_BOARD (BOARD_NO,CLUB_CODE,MEMBER_CODE,CLUB_BOARDLIST_NO,BOARD_TITLE,BOARD_CONTENT,BOARD_DATE,BOARD_HEART,BOARD_CATE_CODE,BOARD_DEL,BOARD_REPORT,BOARD_IMGYN,BOARD_COMMENT_YN) values (23,1,1,1,'<공지>4월 10일 정모합니다~!','<p>4월 10일 정모합니다</p><p>참석의사있으신분들은 댓글남겨주세요</p><p><br></p><p>장소는 추후 공지예정입니다.</p>',to_date('20/04/10','RR/MM/DD'),0,null,'n','n','n','n');
Insert into IFWE.CLUB_BOARD (BOARD_NO,CLUB_CODE,MEMBER_CODE,CLUB_BOARDLIST_NO,BOARD_TITLE,BOARD_CONTENT,BOARD_DATE,BOARD_HEART,BOARD_CATE_CODE,BOARD_DEL,BOARD_REPORT,BOARD_IMGYN,BOARD_COMMENT_YN) values (24,1,1,2,'펭귄펭귄펭귄','<p>제가좋아하는 마다가스카 펭귄이에요&nbsp;</p><p>구경하고 가세용 ~~~!!</p>',to_date('20/04/10','RR/MM/DD'),0,null,'n','n','y','n');
Insert into IFWE.CLUB_BOARD (BOARD_NO,CLUB_CODE,MEMBER_CODE,CLUB_BOARDLIST_NO,BOARD_TITLE,BOARD_CONTENT,BOARD_DATE,BOARD_HEART,BOARD_CATE_CODE,BOARD_DEL,BOARD_REPORT,BOARD_IMGYN,BOARD_COMMENT_YN) values (25,1,2,2,'야옹야옹야옹야옹이','<p>귀여운 우리집 고양이에용</p><p>구경하구 가세요~~~!!!!</p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p>너무귀엽죠?!ㅎㅎ</p>',to_date('20/04/12','RR/MM/DD'),0,'집사,고양이,귀여워','n','n','y','n');
Insert into IFWE.CLUB_BOARD (BOARD_NO,CLUB_CODE,MEMBER_CODE,CLUB_BOARDLIST_NO,BOARD_TITLE,BOARD_CONTENT,BOARD_DATE,BOARD_HEART,BOARD_CATE_CODE,BOARD_DEL,BOARD_REPORT,BOARD_IMGYN,BOARD_COMMENT_YN) values (26,1,1,1,'<공지>5월1일 뮤지컬 레베카 함께보실분~~!','<p class="article1-boardmenu" style="color: rgb(59, 59, 59);"><span style="font-weight: normal;">5월1일 뮤지컬 레베카 보러갑니다&nbsp;</span></p><p class="article1-boardmenu" style="color: rgb(59, 59, 59);"><span style="font-weight: normal;">참석의사있으신분들은 댓글남겨주세요</span></p><div class="article1-bard-content" style="color: rgb(59, 59, 59); overflow: hidden; max-height: 115.2px;"><p>장소 : 블루스퀘어 인터파크홀</p><p>공연일시 : 05.01(금)</p><p>시간 : 19시30분</p><p>캐스팅달력 : 엄기준배우,옥주현배우,이지혜배우,최민철배우</p></div>',to_date('20/04/12','RR/MM/DD'),0,'뮤지컬,레베카,엄기준,옥주현','n','n','y','y');
--REM INSERTING into IFWE.BOARD_IMG
SET DEFINE OFF;
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (24,'펭귄5.jfif','20200410_174239840_604.jfif');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (24,'펭귄3.jpg','20200410_174239829_935.jpg');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (24,'펭귄2.jpg','20200410_174239829_504.jpg');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (24,'펭귄4.jfif','20200410_174239837_447.jfif');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (24,'펭귄1.jpg','20200410_174239829_897.jpg');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (24,'펭귄6.jfif','20200410_174239843_950.jfif');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (25,'KakaoTalk_20200116_175841076.jpg','20200412_173702914_795.jpg');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (25,'KakaoTalk_20200116_175837334.jpg','20200412_173702914_844.jpg');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (25,'KakaoTalk_20200116_175835896.jpg','20200412_173702914_69.jpg');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (25,'MakDung.jpg','20200412_173702940_45.jpg');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (25,'KakaoTalk_20200318_150218513.jpg','20200412_173702980_527.jpg');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (26,'레베카1.jpg','20200412_183613749_664.jpg');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (26,'레베카2.jpg','20200412_183613749_819.jpg');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (26,'레베카5.jpg','20200412_183613762_190.jpg');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (26,'레베카6.jpg','20200412_183613762_91.jpg');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (26,'레베카4.jpg','20200412_183613760_713.jpg');
Insert into IFWE.BOARD_IMG (BOARD_NO,IMG_ORI,IMG_RE) values (26,'레베카3.jpg','20200412_183613774_105.jpg');

-- INSERTING into IFWE.FRIEND
SET DEFINE OFF;
Insert into IFWE.FRIEND (MEMBER_CODE,MEMBER_ID,MEMBER_PNAME,FRIEND_CODE) values (1,'test002','어림없지',2);
Insert into IFWE.FRIEND (MEMBER_CODE,MEMBER_ID,MEMBER_PNAME,FRIEND_CODE) values (2,'test001','동준',1);

--REM INSERTING into IFWE.CLUB_BOARD_COMMENT
SET DEFINE OFF;
Insert into IFWE.CLUB_BOARD_COMMENT (COMENT_NO,BOARD_REF,MEMBER_CODE,COMMENT_CONTENT,COMMENT_DATE,COMMENT_DEL,COMMENT_REPORT) values (35,26,2,'저저저저!!!참석하겠습니다',to_date('20/04/12','RR/MM/DD'),'n','n');
Insert into IFWE.CLUB_BOARD_COMMENT (COMENT_NO,BOARD_REF,MEMBER_CODE,COMMENT_CONTENT,COMMENT_DATE,COMMENT_DEL,COMMENT_REPORT) values (36,26,3,'참석하겠습니다~!',to_date('20/04/12','RR/MM/DD'),'n','n');
Insert into IFWE.CLUB_BOARD_COMMENT (COMENT_NO,BOARD_REF,MEMBER_CODE,COMMENT_CONTENT,COMMENT_DATE,COMMENT_DEL,COMMENT_REPORT) values (37,26,5,'대박~~!!!저도보러가고싶어요',to_date('20/04/12','RR/MM/DD'),'n','n');
Insert into IFWE.CLUB_BOARD_COMMENT (COMENT_NO,BOARD_REF,MEMBER_CODE,COMMENT_CONTENT,COMMENT_DATE,COMMENT_DEL,COMMENT_REPORT) values (38,26,6,'저요저요저요!!참석하겠습니다',to_date('20/04/12','RR/MM/DD'),'n','n');
Insert into IFWE.CLUB_BOARD_COMMENT (COMENT_NO,BOARD_REF,MEMBER_CODE,COMMENT_CONTENT,COMMENT_DATE,COMMENT_DEL,COMMENT_REPORT) values (39,26,1,'------------------여기까지 1차접수완료 따로 개인 메세지드릴게요',to_date('20/04/13','RR/MM/DD'),'n','n');
--REM INSERTING into IFWE.CLUB_CATEGORY
SET DEFINE OFF;
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (1,'공연');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (1,'전시');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (1,'뮤지컬');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (1,'노래');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (2,'뮤지컬');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (2,'영화');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (2,'연극');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (3,'춤');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (3,'노래');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (3,'서울');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (4,'공부');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (4,'스터디');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (5,'공부');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (5,'스터디');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (5,'스터디룸');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (5,'면접');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (6,'놀자');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (6,'뮤지컬');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (6,'공연');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (6,'영화');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (7,'공부');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (7,'취업');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (7,'회사');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (8,'음악');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (8,'춤');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (8,'댄스');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (8,'노래');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (9,'공부');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (9,'취업');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (9,'면접');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (10,'춤');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (10,'노래');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (10,'음악');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (11,'음악');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (11,'춤');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (11,'댄스');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (12,'공연');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (12,'전시');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (12,'영화');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (13,'공부');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (13,'취업');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (13,'면접');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (14,'춤');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (14,'노래');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (15,'공연');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (15,'전시');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (16,'음악');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (16,'댄스');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (16,'춤');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (17,'공부');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (17,'취업');
Insert into IFWE.CLUB_CATEGORY (CLUB_CODE,CLUB_CATE) values (17,'면접');
--REM INSERTING into IFWE.CLUB_HISTORY
SET DEFINE OFF;

--REM INSERTING into IFWE.CONTENTS_CATEGORY
SET DEFINE OFF;
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('공부');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('공연');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('노래');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('놀자');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('댄스');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('면접');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('뮤지컬');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('서울');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('스터디');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('스터디룸');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('연극');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('영화');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('음악');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('전시');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('춤');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('취업');
Insert into IFWE.CONTENTS_CATEGORY (CATE_CODE) values ('회사');
--REM INSERTING into IFWE.CONTENTS_IMG
SET DEFINE OFF;
--REM INSERTING into IFWE.CONTENTS_INFO
SET DEFINE OFF;

--REM INSERTING into IFWE.FULLCALENDAR
SET DEFINE OFF;
--REM INSERTING into IFWE.LOGINRECORD
SET DEFINE OFF;
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (1,10000,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (2,10000,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (3,10000,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (4,10000,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (5,10000,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (6,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (7,2,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (8,10000,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (9,2,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (10,3,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (11,2,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (12,3,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (13,4,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (14,5,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (15,6,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (16,7,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (17,8,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (18,9,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (19,10,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (20,11,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (21,5,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (22,6,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (23,12,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (24,13,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (25,14,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (26,15,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (27,16,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (28,17,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (29,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (30,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (31,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (32,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (33,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (35,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (36,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (37,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (38,2,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (39,2,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (40,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (41,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (42,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (43,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (44,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (45,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (46,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (47,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (56,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (57,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (58,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (59,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (60,1,to_date('20/04/12','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (61,2,to_date('20/04/12','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (62,2,to_date('20/04/12','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (63,1,to_date('20/04/12','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (64,2,to_date('20/04/12','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (65,1,to_date('20/04/12','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (66,2,to_date('20/04/12','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (67,3,to_date('20/04/12','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (68,5,to_date('20/04/12','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (69,6,to_date('20/04/12','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (70,1,to_date('20/04/12','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (71,10000,to_date('20/04/12','RR/MM/DD'),'n');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (34,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (50,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (55,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (48,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (49,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (51,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (52,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (53,1,to_date('20/04/10','RR/MM/DD'),'y');
--Insert into IFWE.LOGINRECORD (LOGINRECORD_NO,MEMBER_CODE,LOGINRECORD_LASTLOGIN,LOGINRECORD_LOGOUT) values (54,1,to_date('20/04/10','RR/MM/DD'),'y');

REM INSERTING into IFWE.MEMBER_EVENT
SET DEFINE OFF;
REM INSERTING into IFWE.MEMBER_MSG
SET DEFINE OFF;
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (42,1,'m1','저기요백동준씨',to_date('20/04/10','RR/MM/DD'),'y',2,null);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (1,1,'c1','가입하고싶어요!',to_date('20/04/10','RR/MM/DD'),'y',2,1);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (2,1,'c1','아아아',to_date('20/04/10','RR/MM/DD'),'y',3,1);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (3,2,'c1','나도공부할꺼야',to_date('20/04/10','RR/MM/DD'),'n',3,2);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (4,1,'f1','친구',to_date('20/04/10','RR/MM/DD'),'y',2,0);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (5,1,'f1','친구',to_date('20/04/10','RR/MM/DD'),'n',3,0);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (6,1,'c1','나도공부할꺼야',to_date('20/04/10','RR/MM/DD'),'y',4,1);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (7,1,'f1','친구',to_date('20/04/10','RR/MM/DD'),'n',4,0);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (8,1,'c1','아아아',to_date('20/04/10','RR/MM/DD'),'y',5,1);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (72,2,'m1','왜요왜요왜요왜요왜요왜요',to_date('20/04/10','RR/MM/DD'),'y',1,null);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (10,2,'c1','아아아',to_date('20/04/10','RR/MM/DD'),'n',5,2);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (11,3,'c1','나도공부할꺼야',to_date('20/04/10','RR/MM/DD'),'n',5,3);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (12,4,'c1','가입할려고요!',to_date('20/04/10','RR/MM/DD'),'n',5,4);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (73,1,'m1','소모임관리가 잘 안되고있는거같습니다
관리부탁드립니다.',to_date('20/04/12','RR/MM/DD'),'n',2,null);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (14,1,'c1','배고파요',to_date('20/04/10','RR/MM/DD'),'y',6,1);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (15,1,'f1','친구',to_date('20/04/10','RR/MM/DD'),'n',6,0);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (16,2,'c1','나도공부할꺼야',to_date('20/04/10','RR/MM/DD'),'n',6,2);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (17,3,'c1','먹방하고싶어요',to_date('20/04/10','RR/MM/DD'),'n',6,3);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (18,4,'c1','먹방하고싶어요',to_date('20/04/10','RR/MM/DD'),'n',6,4);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (19,5,'c1','아아아',to_date('20/04/10','RR/MM/DD'),'n',6,5);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (20,1,'c1',null,to_date('20/04/10','RR/MM/DD'),'y',7,1);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (21,2,'c1',null,to_date('20/04/10','RR/MM/DD'),'y',7,2);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (22,5,'c1','가입할려고요!',to_date('20/04/10','RR/MM/DD'),'y',7,5);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (23,4,'c1','아아아',to_date('20/04/10','RR/MM/DD'),'y',7,4);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (24,1,'f1','친구',to_date('20/04/10','RR/MM/DD'),'y',7,0);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (25,1,'c1','아아아',to_date('20/04/10','RR/MM/DD'),'y',8,1);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (26,2,'c1',null,to_date('20/04/10','RR/MM/DD'),'n',8,2);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (27,3,'c1','가입하고싶어요!',to_date('20/04/10','RR/MM/DD'),'n',8,3);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (28,4,'c1','아아아',to_date('20/04/10','RR/MM/DD'),'n',8,4);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (29,5,'c1','가입하고싶어요!',to_date('20/04/10','RR/MM/DD'),'n',8,5);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (30,7,'c1','먹방하고싶어요',to_date('20/04/10','RR/MM/DD'),'n',8,6);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (31,1,'c1',null,to_date('20/04/10','RR/MM/DD'),'y',9,1);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (32,2,'c1',null,to_date('20/04/10','RR/MM/DD'),'y',9,2);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (33,3,'c1','가입하고싶어요!',to_date('20/04/10','RR/MM/DD'),'y',9,3);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (34,1,'f1','친구',to_date('20/04/10','RR/MM/DD'),'y',9,0);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (35,1,'c1','가입할려고요!',to_date('20/04/10','RR/MM/DD'),'y',10,1);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (36,2,'c1','배고파요',to_date('20/04/10','RR/MM/DD'),'y',10,2);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (37,4,'c1','가입하고싶어요!',to_date('20/04/10','RR/MM/DD'),'y',10,4);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (38,1,'f1','친구',to_date('20/04/10','RR/MM/DD'),'y',10,0);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (39,1,'c1','먹방하고싶어요',to_date('20/04/10','RR/MM/DD'),'y',11,1);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (40,2,'c1','가입하고싶어요!',to_date('20/04/10','RR/MM/DD'),'n',11,2);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (41,1,'c1',null,to_date('20/04/10','RR/MM/DD'),'y',15,1);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (74,1,'m1','사진이랑 실물이 다르신거같아요..
거짓말쟁이',to_date('20/04/12','RR/MM/DD'),'n',2,null);
Insert into IFWE.MEMBER_MSG (MSG_CODE,MEMBER_CODE,MSG_CATE_CODE,MSG_CONTENT,MSG_DATE,MSG_VIEW,MEMBER_FROM,CLUB_CODE) values (70,2,'m1','왜그러시죠?',to_date('20/04/10','RR/MM/DD'),'y',1,null);
REM INSERTING into IFWE.MEMBER_REPORT
SET DEFINE OFF;

REM INSERTING into IFWE.PREMIUM_ORDER
SET DEFINE OFF;
REM INSERTING into IFWE.PREMIUM
SET DEFINE OFF;
REM INSERTING into IFWE.TBL_EVENT
SET DEFINE OFF;
REM INSERTING into IFWE.TBL_SEARCH
SET DEFINE OFF;

Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공부',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'댄스',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'방송',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'취업',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공연',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'연극',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공연',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'면접',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공부',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'댄스',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'방송',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'취업',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공연',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'연극',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공연',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'면접',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공부',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'댄스',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'방송',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'취업',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공연',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'연극',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공연',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'면접',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공부',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'댄스',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'방송',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'취업',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공연',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'연극',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공연',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'면접',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공부',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'댄스',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'방송',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'취업',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공연',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'연극',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공연',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'면접',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공부',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'댄스',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'방송',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'취업',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공연',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'연극',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공연',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'면접',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공부',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'영화',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'뮤지컬',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'댄스',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'방송',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'취업',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공연',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'연극',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'스터디',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공부',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'스터디',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'공부',to_date('20/04/10','RR/MM/DD'),1);
Insert into IFWE.TBL_SEARCH (SEARCH_CODE,SEARCH_KEYWORD,SEARCH_DATE,MEMBER_CODE) values (seq_search_no.nextval,'면접',to_date('20/04/10','RR/MM/DD'),1);


--==============================================================
-- EventBanner 
--==============================================================
insert into tbl_event values(seq_event_no.nextval,'my Event banner','Ifwe app 소개',to_date('04/01/2020 00:00:00', 'mm/dd/yyyy hh24:mi:ss'),to_date('04/30/2020 00:00:00', 'mm/dd/yyyy hh24:mi:ss'),'10000','event_Banner_1.jpg','event_Banner_1.jpg');
--==============================================================
-- fullcalendar 
--==============================================================
insert into fullcalendar values(888,'여행',to_date('2020-04-14 06:00','yyyy-MM-dd HH24:mi'),to_date('2020-04-18 18:00','yyyy-MM-dd HH24:mi'),'강원도','','','#9775fa','#ffffff','false',seq_FC_no.nextval,1);
--==============================================================
-- MainBoard - Notice
--==============================================================
insert into board values ( seq_board_no.nextval,10000,'notice','[공지사항] IFWE 정식 서비스 종료 안내','<p>ifwe 사이트가 4월 19일 정식 서비스 종료 예정입니다.</p><p>그동안 많은 성원 감사드립니다.</p>',NULL,NULL,default,default,default,default);
insert into board values ( seq_board_no.nextval,10000,'notice','[공지사항] IFWE 새학기를 위한 새소식','<p>ifwe 사이트 놀라운 프로젝트 시작합니다 </p><p>감사합니다.</p>',NULL,NULL,default,default,default,default);
insert into board values ( seq_board_no.nextval,10000,'notice','[공지사항] IFWE 직장인을 위한 새소식','<p>ifwe 사이트 놀라운 프로젝트 시작합니다 </p><p>감사합니다.</p>',NULL,NULL,default,default,default,default);
insert into board values ( seq_board_no.nextval,10000,'notice','[공지사항] IFWE 주부들을 위한 새소식','<p>ifwe 사이트 놀라운 프로젝트 시작합니다 </p><p>감사합니다.</p>',NULL,NULL,default,default,default,default);
insert into board values ( seq_board_no.nextval,10000,'notice','[공지사항] IFWE 취준생들을 위한 새소식','<p>ifwe 사이트 놀라운 프로젝트 시작합니다 </p><p>감사합니다.</p>',NULL,NULL,default,default,default,default);
insert into board values ( seq_board_no.nextval,10000,'notice','[공지사항] IFWE 개발자들의 소식-신형철','<p>ifwe 사이트 놀라운 프로젝트 시작합니다 </p><p>감사합니다.</p>',NULL,NULL,default,default,default,default);
insert into board values ( seq_board_no.nextval,10000,'notice','[공지사항] IFWE 개발자들의 소식-정진상','<p>ifwe 사이트 놀라운 프로젝트 시작합니다 </p><p>감사합니다.</p>',NULL,NULL,default,default,default,default);
insert into board values ( seq_board_no.nextval,10000,'notice','[공지사항] IFWE 개발자들의 소식-문보라','<p>ifwe 사이트 놀라운 프로젝트 시작합니다 </p><p>감사합니다.</p>',NULL,NULL,default,default,default,default);
insert into board values ( seq_board_no.nextval,10000,'notice','[공지사항] IFWE 개발자들의 소식-김원재','<p>ifwe 사이트 놀라운 프로젝트 시작합니다 </p><p>감사합니다.</p>',NULL,NULL,default,default,default,default);
insert into board values ( seq_board_no.nextval,10000,'notice','[공지사항] IFWE 개발자들의 소식-장여주','<p>ifwe 사이트 놀라운 프로젝트 시작합니다 </p><p>감사합니다.</p>',NULL,NULL,default,default,default,default);
insert into board values ( seq_board_no.nextval,10000,'notice','[공지사항] IFWE 개발자들의 소식-백동준','<p>ifwe 사이트 놀라운 프로젝트 시작합니다 </p><p>감사합니다.</p>',NULL,NULL,default,default,default,default);
insert into board values ( seq_board_no.nextval,10000,'notice','[공지사항] IFWE APP 출시 0415','<p>ifwe 사이트가 4월 15일 정식 서비스 APP 이 출시 했습니다.</p><p>감사합니다.</p>',NULL,NULL,default,default,default,default);
insert into board values ( seq_board_no.nextval,10000,'notice','[공지사항] IFWE 정식 서비스 시작 안내','<p>ifwe 사이트가 4월 14일 정식 서비스 시작했습니다.</p><p> 감사합니다.</p>',NULL,NULL,default,default,default,default);

--==============================================================
-- MainBoard - QnA
--==============================================================
insert into board values ( seq_board_no.nextval, 1, 'qna', '[문의사항]  다른 소모임 일정 내역을 알 수 있나요', '다른 소모임의 일정을 확인 할 수 있나요?', NULL, NULL, default, default, default, default);
Insert into BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (155,1,'qna','[문의사항] 싫어하는 회원들은 어떻게 처리하고 있나요?','신모씨가 꼴배기 싫어요',null,null,to_date('20/04/16','RR/MM/DD'),0,1,'N');
Insert into BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (156,1,'qna','[문의사항] 멤버십 결제를 했는데 환불받고 싶어요','<p>4월 13일에 결제한 내역을 취소 하고 싶습니다.</p>',null,null,to_date('20/04/16','RR/MM/DD'),0,1,'N');
Insert into BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (157,1,'qna','[문의사항] API 를 제공 받고 싶습니다.','<p>IFWE 사이트의 정보를 제공 하는 API 가 있나요?</p>',null,null,to_date('20/04/16','RR/MM/DD'),0,1,'N');

Insert into BOARD_COMMENT (COMMENT_NO,MEMBER_CODE,BOARD_NO,COMMENT_CONTENT,COMMENT_DATE,COMMENT_LEVEL,COMMENT_NO_REF) values (155,1,155,'어쩌다 그러셨는지 참 안타깝군요',null,1,1);
Insert into BOARD_COMMENT (COMMENT_NO,MEMBER_CODE,BOARD_NO,COMMENT_CONTENT,COMMENT_DATE,COMMENT_LEVEL,COMMENT_NO_REF) values (156,1,156,'결제 내역 영수증 부탁드리겠습니다.',null,1,1);
Insert into BOARD_COMMENT (COMMENT_NO,MEMBER_CODE,BOARD_NO,COMMENT_CONTENT,COMMENT_DATE,COMMENT_LEVEL,COMMENT_NO_REF) values (157,1,157,'5월 중 api 제공 예정입니다. 감사합니다 ifwe 담당자 장 여여여주입니다.',null,1,1);
--==============================================================
-- search_keyword null 삭제.
--==============================================================
--delete from tbl_search where search_keyword is null;
commit;

--=================================================================
--TRIGGER
--=================================================================
create or replace trigger trig_club_member
before
insert on club
for each row
begin
    
    insert into club_members
    values(:new.club_code, :new.club_master,'master',sysdate);
    
    
end;
/

create or replace trigger tri_board_level
    after       
    insert on board_comment 
    for each row 
begin    
    update board set board.board_level= '1'
    where board_no = :new.board_no;
end;
/

create or replace trigger tri_board_level_del
    after       
    delete on board_comment 
    for each row 
begin    
    update board set board.board_level= '0'
    where board_no = :old.board_no;
end;
/




create or replace trigger trig_club_boardlist
after
insert on club
for each row
begin

    insert into club_boardlist
    values(seq_club_boardlist_no.nextval, :new.club_code, '공지사항');
    
    insert into club_boardlist
    values(seq_club_boardlist_no.nextval, :new.club_code, '자유게시판');
    
end;
/

select * from all_triggers;
--클럽 가입하기 누르면 club_current숫자 +1
create or replace trigger club_members_tria
after
insert on club_members 
for each row
begin 

update club set club_current = club_current+1 where club_code = :new.club_code;
end;
/

--클럽 탈퇴하면 club_current-1
create or replace trigger trig_club_members_tria
after 
delete on club_members 
for each row
begin 
update club set club_current = club_current-1 where club_code = :old.club_code;
end;
/

--좋아요 기능 트리거 -1
  create or replace trigger noheart_tria
 before delete on board_heart_tbl for each row
 begin update club_board set board_heart = board_heart-1 where board_no = :old.board_no;
 end;
 /
 
--좋아요 기능 트리거 +1 
 create or replace trigger heart_tria
 after insert on board_heart_tbl for each row
 begin update club_board set board_heart = board_heart+1 where board_no = :new.board_no;
 end;
 /


-- 프리미엄 멤버십 구매시 소모임 프리미엄 정보 업데이트

create or replace trigger buy_premium_tria
after 
insert on premium_order
for each row
begin    
    update club set premium_code = :new.premium_code where club_code = :new.club_code;    
end;
/

-- 친구 수락시 메시지 보내기
create or replace trigger trig_club_friendMsgga
after
insert on friend
for each row
begin

insert into MEMBER_MSG
values(seq_msg_code.nextval,:new.member_code,'m1','친구가되신걸축하드려요~!!',default,'n',:new.friend_code,null);
  
end;
/