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
--DROP TABLE  friend CASCADE CONSTRAINT;
--DROP TABLE  CLUB_CATEGORY CASCADE CONSTRAINT;
--DROP TABLE  CLUB_HISTORY CASCADE CONSTRAINT;
--DROP TABLE  TBL_EVENT CASCADE CONSTRAINT;
--drop sequence seq_member_no;  -- 회원 번호 
--drop sequence seq_board_no;   -- 게시글 번호
--drop sequence seq_club_no;    -- 소모임 번호 
--drop sequence seq_msg_code;   -- 메세지 번호
--drop sequence seq_order_code; -- 구매기록 번호
--drop sequence seq_contents_code; -- 컨텐츠 번호
--=================================================================
--select
--=================================================================
--select * from tab; -- 전체 테이블 조회
select * from member;
select * from member_profile;
--=================================================================
--TABLE
--=================================================================

--  index

-- 1.회원
-- 2.회원 프로필 테이블
-- 3.회원 이벤트 테이블
-- 4.회원 이벤트 참가기록 테이블
-- 5.회원 신고 기록 테이블
-- 6.회원 메세지 카테고리 테이블
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
-- 3.회원 이벤트 테이블 - 미사용 테이블
CREATE TABLE  TBL_EVENT  (
	 event_code 	NUMBER		primary key, -- 이벤트 생성 코드 시퀀스 사용 예정
	 event_title 	VARCHAR2(100)		NULL, -- 이벤트 제목
	 event_content 	VARCHAR2(2000)		NULL, -- 이벤트 내용
	 event_start 	DATE		NULL, -- 이벤트 시작일
	 event_end 	DATE		NULL,     -- 이벤트 종료일
     member_code NUMBER NOT NULL,
     event_img_ori varchar2(200) NULL,
     event_img_re varchar2(200) NULL
);
-- 4.회원 이벤트 참가기록 테이블 - 미사용 테이블
CREATE TABLE  MEMBER_EVENT  (
	 event_code 	NUMBER		NOT NULL, -- 이벤트 생성코드 참조
	 member_code 	NUMBER		NOT NULL, -- 회원 멤버 코드 참조
	 event_date 	DATE		NULL,    -- 이벤트 참여일
     CONSTRAINT fk_memberEvent_memberCode foreign key(member_code)
                                                        REFERENCES member(member_code)                                                    
                                                        on delete cascade
     
);
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
            CONSTRAINT fk_friend_memberCode foreign key(member_code)
                                                      REFERENCES member(member_code)                                                    
                                                      on delete cascade
);
-- 9.프리미엄 
CREATE TABLE  PREMIUM  (
	 premium_code 	VARCHAR2(30)		primary key, -- 프리미엄 코드
	 premium_name 	VARCHAR2(50)		NULL, -- 프리미엄 명
	 premium_info 	VARCHAR2(200)		NULL,  -- 프리미엄 설명
	 premium_price 	NUMBER		NULL -- 프리미엄 가격
);

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
	 member_code 	NUMBER		NOT NULL, -- 검색한 회원 번호 --pk
	 cate_code 	VARCHAR2(100)		NOT NULL -- 검색어 분류 -- 어디서검색하는지로할지
);


-- 15.컨텐츠 카테고리 테이블 -- 검색어 자동완성
CREATE TABLE  CONTENTS_CATEGORY  (
    cate_code    VARCHAR2(100)   PRIMARY KEY
);

-- 16.컨텐츠 정보 테이블
CREATE TABLE  CONTENTS_INFO  (
	 contents_code 	NUMBER		PRIMARY KEY, -- 시퀀스 (만들것)
	 contents_name 	VARCHAR2(100)		NULL,
	 contents_info 	VARCHAR2(2000)		NULL,
	 contents_date 	DATE		default sysdate, 
	 contents_site 	VARCHAR2(300)		NULL,
	 cate_code 	VARCHAR2(100)		NOT NULL
);

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

select * from club_boardlist;

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
     constraint fk_club_code_board foreign key (club_code) references club (club_code)ON DELETE CASCADE,
     constraint fk_member_code foreign key (member_code) references member (member_code)ON DELETE CASCADE,
     constraint fk_club_boardlist_no foreign key (club_boardlist_no) references CLUB_BOARDLIST (club_boardlist_no)ON DELETE CASCADE
     
);

-- 21.소모임 게시판 댓글 테이블
CREATE TABLE  CLUB_BOARD_COMMENT  (
	 coment_no 	NUMBER		NOT NULL, -- 댓글 시퀀스 or 게시판 시퀀스 
	 board_ref 	NUMBER		NOT NULL, -- 댓글이 달린 원 게시물 번호
	 member_code 	NUMBER		NOT NULL,
	 comment_content 	VARCHAR2(500)		NULL,
	 comment_date 	DATE		NULL,
	 comment_level 	NUMBER		NULL,
	 comment_del 	CHAR(1)		NULL,
	 comment_ref 	NUMBER		NULL
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
CREATE TABLE  CLUB_HISTORY  (
	 club_code 	NUMBER		NOT NULL,
	 club_count 	NUMBER		NULL,
	 club_boardcnt 	NUMBER		NULL,
	 club_usedate 	DATE		default sysdate,
	 member_code 	NUMBER		NOT NULL
);
-- 26.소모임 일정정보 저장 테이블
CREATE TABLE  CALENDAR  (
	 club_code 	NUMBER		NOT NULL,
	 club_master 	NUMBER		NOT NULL,
	 calendar_title 	VARCHAR2(300)		NULL,
	 calendar_start 	DATE		NULL,
	 calendar_end 	DATE		NULL,
	 calendar_content 	VARCHAR2(500)		NULL
);










--=================================================================
--SEQUENCE
--=================================================================
create sequence seq_member_no;  -- 회원 번호 
create sequence seq_board_no;   -- 게시글 번호
create sequence seq_board_comment_no; -- 게시글 답변 번호
create sequence seq_club_no;    -- 소모임 번호 
create sequence seq_msg_code;   -- 메세지 번호
create sequence seq_order_code; -- 구매기록 번호
create sequence seq_contents_code; -- 컨텐츠 번호
create sequence seq_board_comment_no;
create sequence seq_club_board_no;  --클럽게시판번호
create sequence seq_club_boardlist_no; --클럽게시판목록번호
create sequence seq_event_no; -- 이벤트 번호
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

-- 0331 프리미엄 구매시 자동으로 CLUB 프리미엄이 변경됨.
create or replace trigger trig_update_clubPremium
after
insert on PREMIUM_ORDER
for each row
begin    
    update club set PREMIUM_CODE = :new.premium_code where club_code= :new.club_code;
end;
/
--=================================================================
--MEMBER DUMMY
--=================================================================
--관리자 계정
--insert into member values(seq_member_no.nextval,'admin1234','$2a$10$gjA.1nKhR2SNMW8RvdMabuVjrh5cZpoL5aAOUqXoTlbffj1ytQc9i','관리자',NULL,'경기','admin1234@ifwe.com',to_date('06/20/1990 00:00:00', 'mm/dd/yyyy hh24:mi:ss'),'m','경기 성남시 분당구 대왕판교로606번길 45',default,null,'member',0,'공연전시,스터디,음악댄스');
--insert into member_profile values(
--      1,null,null,null,null,'0','m',null
--
--      );
--id : admin1234
--password : admin1234!
COMMIT;
-- 사용자 계정



--=============================================
-- board_cate dummy
--=============================================
insert into board_category values('notice','공지사항');
insert into board_category values('qna','문의사항');
insert into board_category values('report','신고');
COMMIT;
--=============================================
-- board dummy
--=============================================
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'notice','테스트6','<p>테스트6</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'notice','테스트7','<p>테스트7</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'notice','테스트8','<p>테스트8</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'notice','테스트9','<p>테스트9</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'notice','테스트10','<p>테스트10</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'notice','테스트11','<p>테스트11</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'report','테스트21','<p>테스트21</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'report','테스트22','<p>테스트22</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'report','테스트23','<p>테스트23</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'report','테스트24','<p>테스트24</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'report','테스트25','<p>테스트25</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'report','테스트26','<p>테스트26</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'qna','테스트31','<p>테스트31</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'qna','테스트32','<p>테스트32</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'qna','테스트33','<p>테스트33</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'qna','테스트34','<p>테스트34</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'qna','테스트35','<p>테스트35</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'notice','공지사항_TEST_1','<p>반갑 습니다 이곳은 IF WE 공지사항 게시판 입니다....</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'notice','테스트2','<p>테스트2</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'report','테스트5','<p>테스트5</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,3,'notice','test Title','test Contents',null,null,to_date('20/03/22','RR/MM/DD'),0,0,'N');
Insert into IFWE.BOARD (BOARD_NO,MEMBER_CODE,BOARD_CATE,BOARD_TITLE,BOARD_CONTENT,BOARD_IMG_ORI,BOARD_IMG_RE,BOARD_DATE,BOARD_READCOUNT,BOARD_LEVEL,BOARD_DEL) values (seq_board_no.nextval,1,'notice','공지사항_TEST_1','<p>반갑 습니다 이곳은 IF WE 공지사항 게시판 입니다....</p>',null,null,to_date('20/03/24','RR/MM/DD'),0,0,'N');
commit;
insert into board_comment values(seq_board_comment_no.nextval,'1','13','dcdcd',sysdate,'1','1');
select * from board_comment;
delete board_comment where member_code = '1';

create or replace trigger tri_board_level
    after          --주  DML문 이전(before), 이후 (after) 실행 결정
    insert on board_comment
    for each row -- 문장/행 레벨 트리거(없으면 문장레벨 있으면 행레벨)
begin    
    update board set board_level= '1'
end;
/
 
drop trigger tri_board_level;

