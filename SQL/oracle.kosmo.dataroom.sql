SELECT * FROM Dataroom;

CREATE TABLE Dataroom(
	idx NUMBER PRIMARY KEY,
	name VARCHAR2(30) NOT NULL,
	title VARCHAR2(200) NOT NULL,
	content VARCHAR2(2000) NOT NULL,
	postdate DATE DEFAULT SYSDATE,
	attachedfile VARCHAR2(100),
	downcount VARCHAR2(5) DEFAULT 0 NOT NULL,
	pass VARCHAR2(30) NOT NULL,
	visitcount VARCHAR2(5) DEFAULT 0 NOT NULL
);
DROP TABLE Dataroom;

CREATE SEQUENCE seq_board_dataroom
	INCREMENT BY 1
    START WITH 1
    NOMAXVALUE
    MINVALUE 1
    NOCYCLE
    NOCACHE;
    
INSERT INTO Dataroom (idx, title, name, content, pass, downcount)
	VALUES(seq_board_dataroom.NEXTVAL, '제목1', '홍길동', '내용1', '1234', 0);
INSERT INTO Dataroom (idx, title, name, content, pass, downcount)
	VALUES(seq_board_dataroom.NEXTVAL, '제목2', '홍길동', '내용1', '1234', 0);
INSERT INTO Dataroom (idx, title, name, content, pass, downcount)
	VALUES(seq_board_dataroom.NEXTVAL, '제목3', '홍길동', '내용1', '1234', 0);
INSERT INTO Dataroom (idx, title, name, content, pass, downcount)
	VALUES(seq_board_dataroom.NEXTVAL, '제목4', '홍길동', '내용1', '1234', 0);
INSERT INTO Dataroom (idx, title, name, content, pass, downcount)
	VALUES(seq_board_dataroom.NEXTVAL, '제목5', '홍길동', '내용1', '1234', 0);
	
COMMIT;