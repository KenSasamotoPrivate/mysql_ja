-- DROP DATABASE IF EXISTS sql_lesson;

-- CREATE DATABASE sql_lesson DEFAULT CHARACTER SET UTF8;

-- USE sql_lesson;

CREATE TABLE `club`
(
  `club_code` varchar(10) NOT NULL,
  `club_name` varchar(100) DEFAULT NULL,
  `club_type` varchar(10) DEFAULT NULL,
   PRIMARY KEY(`club_code`)
);

INSERT INTO `club` (club_code, club_name, club_type) VALUE ("C_001", "吹奏楽部", "文化部");
INSERT INTO `club` (club_code, club_name, club_type) VALUE ("C_002", "美術部", "文化部");
INSERT INTO `club` (club_code, club_name, club_type) VALUE ("C_003", "手芸部", "文化部");
INSERT INTO `club` (club_code, club_name, club_type) VALUE ("S_001", "サッカー部", "運動部");
INSERT INTO `club` (club_code, club_name, club_type) VALUE ("S_002", "野球部", "運動部");
INSERT INTO `club` (club_code, club_name, club_type) VALUE ("S_003", "水泳部", "運動部");
INSERT INTO `club` (club_code, club_name, club_type) VALUE ("S_004", "柔道部", "運動部");

CREATE TABLE `student`
(
  `student_code` varchar(10) NOT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `club_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY(`student_code`),
  FOREIGN KEY(`club_code`) REFERENCES `club`(`club_code`)
);

INSERT INTO `student` (student_code, student_name, club_code) VALUE("0001", "山田太郎", "C_001");
INSERT INTO `student` (student_code, student_name, club_code) VALUE("0002", "鈴木一郎", "S_002");
INSERT INTO `student` (student_code, student_name, club_code) VALUE("0003", "田中二郎", "S_001");
INSERT INTO `student` (student_code, student_name, club_code) VALUE("0004", "山本花子", "S_003");
INSERT INTO `student` (student_code, student_name, club_code) VALUE("0005", "伊藤洋子", "C_002");
INSERT INTO `student` (student_code, student_name, club_code) VALUE("0006", "木村雄一", NULL);
INSERT INTO `student` (student_code, student_name, club_code) VALUE("0007", "中田賢一", "C_001");
INSERT INTO `student` (student_code, student_name, club_code) VALUE("0008", "川井伸二", "S_002");