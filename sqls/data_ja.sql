DROP DATABASE IF EXISTS sql_lesson;

CREATE DATABASE sql_lesson DEFAULT CHARACTER SET UTF8;

USE sql_lesson;

CREATE TABLE `部活表`
(
  `部活コード` varchar(10) NOT NULL,
  `部名` varchar(100) DEFAULT NULL,
  `種別` varchar(10) DEFAULT NULL,
   PRIMARY KEY(`部活コード`)
);

INSERT INTO `部活表` (`部活コード`, `部名`, `種別`) VALUE ("C_001", "吹奏楽部", "文化部");
INSERT INTO `部活表` (`部活コード`, `部名`, `種別`) VALUE ("C_002", "美術部", "文化部");
INSERT INTO `部活表` (`部活コード`, `部名`, `種別`) VALUE ("C_003", "手芸部", "文化部");
INSERT INTO `部活表` (`部活コード`, `部名`, `種別`) VALUE ("S_001", "サッカー部", "運動部");
INSERT INTO `部活表` (`部活コード`, `部名`, `種別`) VALUE ("S_002", "野球部", "運動部");
INSERT INTO `部活表` (`部活コード`, `部名`, `種別`) VALUE ("S_003", "水泳部", "運動部");
INSERT INTO `部活表` (`部活コード`, `部名`, `種別`) VALUE ("S_004", "柔道部", "運動部");

CREATE TABLE `生徒表`
(
  `生徒番号` varchar(10) NOT NULL,
  `氏名` varchar(100) DEFAULT NULL,
  `所属部活コード` varchar(10) DEFAULT NULL,
  PRIMARY KEY(`生徒番号`),
  FOREIGN KEY(`所属部活コード`) REFERENCES `部活表`(`部活コード`)
);

INSERT INTO `生徒表` (`生徒番号`, `氏名`, `所属部活コード`) VALUE("0001", "山田太郎", "C_001");
INSERT INTO `生徒表` (`生徒番号`, `氏名`, `所属部活コード`) VALUE("0002", "鈴木一郎", "S_002");
INSERT INTO `生徒表` (`生徒番号`, `氏名`, `所属部活コード`) VALUE("0003", "田中二郎", "S_001");
INSERT INTO `生徒表` (`生徒番号`, `氏名`, `所属部活コード`) VALUE("0004", "山本花子", "S_003");
INSERT INTO `生徒表` (`生徒番号`, `氏名`, `所属部活コード`) VALUE("0005", "伊藤洋子", "C_002");
INSERT INTO `生徒表` (`生徒番号`, `氏名`, `所属部活コード`) VALUE("0006", "木村雄一", NULL);
INSERT INTO `生徒表` (`生徒番号`, `氏名`, `所属部活コード`) VALUE("0007", "中田賢一", "C_001");
INSERT INTO `生徒表` (`生徒番号`, `氏名`, `所属部活コード`) VALUE("0008", "川井伸二", "S_002");


-- 具体例として上記の生徒表から

-- SELECT 生徒番号, 氏名, 所属部活コード FROM 生徒表 WHERE EXISTS (SELECT * FROM 部活表 WHERE 部活表.部活コード = 生徒表.所属部活コード AND 種別 = '文化部')

-- SELECT 生徒番号, 氏名, 所属部活コード FROM 生徒表 WHERE 所属部活コード IN (SELECT 部活コード FROM 部活表 WHERE 種別 = '文化部')

CREATE TABLE `購入表`
(
  `id` int NOT NULL AUTO_INCREMENT,
  `購入日付` date NOT NULL,
  `購入品目` varchar (100) NOT NULL,
  `価格` int NOT NULL,
  PRIMARY KEY(`id`)
);

INSERT INTO `購入表` (`購入日付`, `購入品目`, `価格`) VALUE ("2022-10-08", "書籍", 2000);
INSERT INTO `購入表` (`購入日付`, `購入品目`, `価格`) VALUE ("2022-10-09", "食料品", 3000);
INSERT INTO `購入表` (`購入日付`, `購入品目`, `価格`) VALUE ("2022-10-10", "衣服", 10000);
INSERT INTO `購入表` (`購入日付`, `購入品目`, `価格`) VALUE ("2022-10-11", "クリーニング代", 4000);

-- SELECT 購入品目, 価格 FROM 購入表;
-- SELECT MAX(価格) FROM 購入表;

-- SELECT 購入品目, 価格 FROM 購入表 WHERE 価格 = (SELECT MAX(価格) FROM 購入表);
-- SELECT 購入品目, 価格 FROM 購入表 ORDER BY 価格 DESC LIMIT 1;