CREATE  TABLE Board(
        num NUMBER PRIMARY KEY,
        title VARCHAR2(200) NOT NULL,
        content VARCHAR2(2000) NOT NULL,
        id VARCHAR2(30) NOT NULL,
        postdate DATE DEFAULT SYSDATE,
        visitCount NUMBER(6)
);

ALTER   TABLE Board
        ADD CONSTRAINT board_member_fk FOREIGN KEY(id)
        REFERENCES member(id);        
        
CREATE  SEQUENCE seq_board_num
        INCREMENT BY 1
        START WITH 1
        NOMAXVALUE
        MINVALUE 1
        NOCYCLE
        NOCACHE;

INSERT  INTO Member(id, pass, name)
        VALUES('kosmo', '1111', '코스모테스트');
        
INSERT INTO Board VALUES(seq_board_num.NEXTVAL, '제목1입니다', '내용1입니다.', 'kosmo', SYSDATE, 0);
INSERT INTO Board VALUES(seq_board_num.NEXTVAL, '제목2입니다', '내용2입니다.', 'kosmo', SYSDATE, 0);
INSERT INTO Board VALUES(seq_board_num.NEXTVAL, '제목3입니다', '내용3입니다.', 'kosmo', SYSDATE, 0);
INSERT INTO Board VALUES(seq_board_num.NEXTVAL, '제목4입니다', '내용4입니다.', 'kosmo', SYSDATE, 0);
INSERT INTO Board VALUES(seq_board_num.NEXTVAL, '제목5입니다', '내용5입니다.', 'kosmo', SYSDATE, 0);
    
SELECT * FROM Board;
COMMIT;

SELECT  *
FROM    Board
ORDER BY num DESC;

SELECT *
FROM    Board
WHERE   title LIKE '%제목3'
ORDER   BY num DESC
;

SELECT COUNT(*)
FROM    Board
WHERE   title LIKE '제목3'
;

SELECT COUNT(*) FROM Board  WHERE title LIKE '%1%' ;
SELECT * FROM Board  WHERE title LIKE '%1%'  ORDER BY num DESC ;

SELECT * FROM Board WHERE num=7;
UPDATE Board SET visitcount=visitcount+1 WHERE num=10;
SELECT num, visitcount FROM Board WHERE num=10;

SELECT num, title, content, B.id, postdate, visitcount, name 
FROM member M inner join Board B
WHERE num='9';

UPDATE Board SET title='update', content='' WHERE num='9';

--페이지 처리
--서브쿼리를 통해 board테이블의 rownum으로 구간을 정해 레코드 추출
--Board 테이블의 모든 레코드를 내림차순 정렬해서 가져옴
--1의 결과에 
SELECT * FROM(
  SELECT Tb.*, rownum rNum FROM(
    SELECT * FROM Board ORDER BY num DESC
  ) Tb
)
WHERE rNum BETWEEN 1 AND 10
;  

--위의 서브쿼리에 검색조건 추가
SELECT * FROM(
  SELECT Tb.*, ROWNUM rNum FROM(
    SELECT * FROM Board 
    WHERE title LIKE '%1%'
    ORDER BY num DESC
  ) Tb
)
WHERE rNum BETWEEN 1 AND 10
;  

--회원이름 검색 join을 이용한
SELECT * FROM Board B
  INNER JOIN Member M ON B.id = M.id
WHERE M.name LIKE '%가산%'
ORDER BY num DESC;
--위의 조인문을 서브쿼리 관련 변경
SELECT * FROM(
  SELECT Tb.*, ROWNUM rNum FROM(
    SELECT * FROM Board B
          INNER JOIN Member M ON B.id = M.id
  ) Tb
)
WHERE rNum BETWEEN 1 AND 10
; 

CREATE TABLE myfile(
  idx NUMBER PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  title VARCHAR2(200) NOT NULL,
  inter VARCHAR2(100),
  ofile VARCHAR2(100) NOT NULL,
  sfile VARCHAR2(50) NOT NULL,;
  
  
  
  create table myfile (
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    inter varchar2(100),
    ofile varchar2(100) not null,
    sfile varchar2(30) not null,
    postdate date default sysdate
);