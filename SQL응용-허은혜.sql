-- ---------------------------------------------------------------------------------------
--  영화정보DB 데이터베이스 생성
-- ---------------------------------------------------------------------------------------
drop database if exists 영화정보DB;
create database if not exists 영화정보DB;

-- ---------------------------------------------------------------------------------------
--  영화정보DB 관리자 설정
-- ---------------------------------------------------------------------------------------
drop user if exists movie_db@localhost;
create user if not exists movie_db@localhost identified with mysql_native_password by 'qwer1234!';
grant all privileges on 영화정보DB.* to movie_db@localhost with grant option;
show databases;

use 영화정보DB;

-- ---------------------------------------------------------------------------------------
--  테이블 생성
-- ---------------------------------------------------------------------------------------
create table 배우(
	주민번호 varchar(14),
    이름 varchar(10) not null,
    성별 enum('남','여'),
    출생일 varchar(6),
    출생지 varchar(20),
    키 int,
    몸무게 int,
    혈액형 varchar(2),
    primary key(주민번호)
);
desc 배우;

create table 감독(
	등록번호 varchar(10),
    이름 varchar(10) not null,
    성별 enum('남','여'),
    출생일 varchar(6),
    출생지 varchar(20),
	학력사항 varchar(20),
    primary key(등록번호)
);
desc 감독;

create table 장르(
	장르코드 varchar(10),
    장르명 varchar(20) not null,
    primary key(장르코드)
);
desc 장르;

create table 영화(
	영화코드 varchar(10),
    제목 varchar(50) not null,
    제작년도 varchar(4) not null,
    상영시간 varchar(20) not null,
    개봉일자 varchar(10) not null,
    제작사 varchar(20) not null,
    배급사 varchar(20) not null,
    주민번호 varchar(14),
    등록번호 varchar(10),
    장르코드 varchar(10),
    primary key(영화코드,주민번호,등록번호,장르코드),
    foreign key(주민번호) references 배우(주민번호),
    foreign key(등록번호) references 감독(등록번호),
    foreign key(장르코드) references 장르(장르코드)
);
desc 영화;


-- ---------------------------------------------------------------------------------------
--  테이블 자료 삽입
-- ---------------------------------------------------------------------------------------
-- 배우 자료
insert into 배우 values(
	'100000-0000001', -- 주민번호 varchar(14)
    '홍길동', -- 이름 varchar(10) not null
    '남', -- 성별 enum('남','여')
    '950812', -- 출생일 varchar(6)
    '서울', -- 출생지 varchar(20)
    '180', -- 키 int
    '70', -- 몸무게 int
    'A' -- 혈액형 varchar(2)
);
insert into 배우 values(
	'100000-0000002', -- 주민번호 varchar(14)
    '이몽룡', -- 이름 varchar(10) not null
    '남', -- 성별 enum('남','여')
    '940324', -- 출생일 varchar(6)
    '인천', -- 출생지 varchar(20)
    '182', -- 키 int
    '69', -- 몸무게 int
    'B' -- 혈액형 varchar(2)
);
insert into 배우 values(
	'100000-0000003', -- 주민번호 varchar(14)
    '성춘향', -- 이름 varchar(10) not null
    '여', -- 성별 enum('남','여')
    '980105', -- 출생일 varchar(6)
    '서울', -- 출생지 varchar(20)
    '168', -- 키 int
    '45', -- 몸무게 int
    'O' -- 혈액형 varchar(2)
);
insert into 배우 values(
	'100000-0000004', -- 주민번호 varchar(14)
    '월매', -- 이름 varchar(10) not null
    '여', -- 성별 enum('남','여')
    '920707', -- 출생일 varchar(6)
    '부산', -- 출생지 varchar(20)
    '169', -- 키 int
    '46', -- 몸무게 int
    'A' -- 혈액형 varchar(2)
);
insert into 배우 values(
	'100000-0000005', -- 주민번호 varchar(14)
    '변사또', -- 이름 varchar(10) not null
    '남', -- 성별 enum('남','여')
    '901112', -- 출생일 varchar(6)
    '대구', -- 출생지 varchar(20)
    '181', -- 키 int
    '75', -- 몸무게 int
    'B' -- 혈액형 varchar(2)
);

-- 감독 자료
insert into 감독 values(
	'0001', -- 등록번호 varchar(10)
    '강감찬', -- 이름 varchar(10) not null
    '남', -- 성별 enum('남','여')
    '820514', -- 출생일 varchar(6)
    '서울', -- 출생지 varchar(20)
	'대졸' -- 학력사항 varchar(10)
);
insert into 감독 values(
	'0002', -- 등록번호 varchar(10)
    '봉준호', -- 이름 varchar(10) not null
    '남', -- 성별 enum('남','여')
    '690914', -- 출생일 varchar(6)
    '대구', -- 출생지 varchar(20)
	'대졸' -- 학력사항 varchar(10)
);
insert into 감독 values(
	'0003', -- 등록번호 varchar(10)
    '오나라', -- 이름 varchar(10) not null
    '여', -- 성별 enum('남','여')
    '680811', -- 출생일 varchar(6)
    '인천', -- 출생지 varchar(20)
	'대졸' -- 학력사항 varchar(10)
);
insert into 감독 values(
	'0004', -- 등록번호 varchar(10)
    '김상우', -- 이름 varchar(10) not null
    '남', -- 성별 enum('남','여')
    '720125', -- 출생일 varchar(6)
    '서울', -- 출생지 varchar(20)
	'고졸' -- 학력사항 varchar(10)
);
insert into 감독 values(
	'0005', -- 등록번호 varchar(10)
    '김지우', -- 이름 varchar(10) not null
    '여', -- 성별 enum('남','여')
    '821215', -- 출생일 varchar(6)
    '인천', -- 출생지 varchar(20)
	'고졸' -- 학력사항 varchar(10)
);

-- 장르 자료
insert into 장르 values(
	'000001', -- 장르코드 varchar(10)
    'romantic comedy' -- 장르명 varchar(20) not null
);
insert into 장르 values(
	'000002', -- 장르코드 varchar(10)
    '액션' -- 장르명 varchar(20) not null
);
insert into 장르 values(
	'000003', -- 장르코드 varchar(10)
    '판타지' -- 장르명 varchar(20) not null
);
insert into 장르 values(
	'000004', -- 장르코드 varchar(10)
    '포르노' -- 장르명 varchar(20) not null
);
insert into 장르 values(
	'000005', -- 장르코드 varchar(10)
    '공포' -- 장르명 varchar(20) not null
);

-- 영화 자료
insert into 영화 values(
	'22010101', -- 영화코드 varchar(10)
    '돌아온 용가리', -- 제목 varchar(50) not null
	'2021', -- 제작년도 varchar(4) not null
	'16:15', -- 상영시간 varchar(10) not null
	'2021-12-24', -- 개봉일자 varchar(10) not null
	'영구픽처스', -- 제작사 varchar(20) not null
	'좋은친구들', -- 배급사 varchar(20) not null
	'100000-0000001', -- 주민번호 varchar(14)
	'0001', -- 등록번호 varchar(10)
	'000001' -- 장르코드 varchar(10)
);
insert into 영화 values(
	'22010102', -- 영화코드 varchar(10)
    '날아라 슈퍼보드', -- 제목 varchar(50) not null
	'1998', -- 제작년도 varchar(4) not null
	'18:30', -- 상영시간 varchar(10) not null
	'2019-05-20', -- 개봉일자 varchar(10) not null
	'날아라스튜디오', -- 제작사 varchar(20) not null
	'영화박스', -- 배급사 varchar(20) not null
	'100000-0000003', -- 주민번호 varchar(14)
	'0004', -- 등록번호 varchar(10)
	'000002' -- 장르코드 varchar(10)
);
insert into 영화 values(
	'22010103', -- 영화코드 varchar(10)
    '반지의 제왕', -- 제목 varchar(50) not null
	'2019', -- 제작년도 varchar(4) not null
	'17:45', -- 상영시간 varchar(10) not null
	'2020-01-10', -- 개봉일자 varchar(10) not null
	'반지스튜디오', -- 제작사 varchar(20) not null
	'영화박스', -- 배급사 varchar(20) not null
	'100000-0000005', -- 주민번호 varchar(14)
	'0004', -- 등록번호 varchar(10)
	'000003' -- 장르코드 varchar(10)
);
insert into 영화 values(
	'22010104', -- 영화코드 varchar(10)
    '뷰티인사이드', -- 제목 varchar(50) not null
	'2020', -- 제작년도 varchar(4) not null
	'14:30', -- 상영시간 varchar(10) not null
	'2021-12-24', -- 개봉일자 varchar(10) not null
	'영구픽처스', -- 제작사 varchar(20) not null
	'좋은친구들', -- 배급사 varchar(20) not null
	'100000-0000004', -- 주민번호 varchar(14)
	'0002', -- 등록번호 varchar(10)
	'000001' -- 장르코드 varchar(10)
);
insert into 영화 values(
	'22010105', -- 영화코드 varchar(10)
    '비밀의정원', -- 제목 varchar(50) not null
	'2021', -- 제작년도 varchar(4) not null
	'18:30', -- 상영시간 varchar(10) not null
	'2021-06-12', -- 개봉일자 varchar(10) not null
	'쇼박스', -- 제작사 varchar(20) not null
	'좋은친구들', -- 배급사 varchar(20) not null
	'100000-0000002', -- 주민번호 varchar(14)
	'0003', -- 등록번호 varchar(10)
	'000004' -- 장르코드 varchar(10)
);
insert into 영화 values(
	'22010106', -- 영화코드 varchar(10)
    '전설의고향', -- 제목 varchar(50) not null
	'2005', -- 제작년도 varchar(4) not null
	'18:30', -- 상영시간 varchar(10) not null
	'2006-04-04', -- 개봉일자 varchar(10) not null
	'쇼박스', -- 제작사 varchar(20) not null
	'영화박스', -- 배급사 varchar(20) not null
	'100000-0000001', -- 주민번호 varchar(14)
	'0005', -- 등록번호 varchar(10)
	'000005' -- 장르코드 varchar(10)
);

select * from 배우;
select * from 감독;
select * from 장르;
select * from 영화;


-- 2020년에 제작된 장르별 영화 편수
select 장르.장르명 as 장르, count(영화.장르코드) as 제작편수
from 영화 join 장르 on 영화.장르코드=장르.장르코드
group by 영화.장르코드;


-- 로맨틱 코미디에 출연하지 않은 배우목록
select 배우.이름
from 배우 join 영화 on 배우.주민번호 = 영화.주민번호 join 장르 on 장르.장르코드=영화.장르코드
where 장르.장르명 not in('romantic comedy');


-- romantic comedy인 자료의 장르코드와 장르명 변경
-- 제 컴퓨터에서 update문 에러때문에 외래키 해제 코드 임시로 넣어놨습니다.
SET foreign_key_checks = 0;    # 외래키 체크 설정 해제
update 영화 set 영화.장르코드='000111' where 영화.장르코드 in(select 장르.장르코드 from 장르 where 장르.장르명='romantic comedy');
update 장르 set 장르.장르코드='000111', 장르.장르명='로맨틱 코미디' where 장르.장르명='romantic comedy';
SET foreign_key_checks = 1;    # 외래키 체크 설정

select * from 장르;
select * from 영화;


-- 장르가 포르노인 영화에 대한 모든 정보 삭제
select * from 영화;
delete from 영화
where 영화.장르코드 in(
	select 장르.장르코드
    from 장르
    where 장르.장르명= '포르노'
);
select * from 영화;

select * from 장르;
delete from 장르
where 장르.장르명= '포르노';
select * from 장르;
