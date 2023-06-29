CREATE USER 'simple'@'localhost' IDENTIFIED BY 'simple';
USE TEST;

-- TEST.`MEMBER` definition

CREATE TABLE MEMBER (
                          `MEMBER_ID` varchar(100) NOT NULL,
                          `MEMBER_PASSWORD` varchar(100) NOT NULL,
                          `MEMBER_NAME` varchar(100) NOT NULL,
                          `MEMBER_PHONENUM` varchar(100) NOT NULL,
                          PRIMARY KEY (`MEMBER_ID`)
)
;
-- TEST.PARKING definition

CREATE TABLE PARKING (
                           `PARKING_ID` int NOT NULL AUTO_INCREMENT,
                           `REALTIME_PARKING` int DEFAULT NULL,
                           `PARKING_NAME` varchar(100) DEFAULT NULL,
                           `ENTIRE_PARKING` int DEFAULT NULL,
                           `AVAILABLE_PARKING` int DEFAULT NULL,
                           `PARKING_UPDATE` tinyint(1) DEFAULT NULL,
                           PRIMARY KEY (`PARKING_ID`)
)
;
-- TEST.REGION definition

CREATE TABLE REGION (
                          `REGION_ID` int NOT NULL AUTO_INCREMENT,
                          `REALTIME_POPULATION` mediumtext,
                          `PLACE_CONGESTION` varchar(100) DEFAULT NULL,
                          `REGIONUPDATE` datetime DEFAULT NULL,
                          PRIMARY KEY (`REGION_ID`)
)
;
-- TEST.WEATHER definition

CREATE TABLE WEATHER (
                           `WEATHER_ID` int NOT NULL AUTO_INCREMENT,
                           `TEMPERTURE` float DEFAULT NULL,
                           `SENSORY_TEMPERATURE` float DEFAULT NULL,
                           `FINEDUST` varchar(100) DEFAULT NULL,
                           `ULTRA_FINEDUST` varchar(100) DEFAULT NULL,
                           `PRECIPITATION` float DEFAULT NULL,
                           `WEATHER_UPDATE` datetime DEFAULT NULL,
                           PRIMARY KEY (`WEATHER_ID`)
)
;

-- TEST.ACCIDENT definition

CREATE TABLE ACCIDENT (
                            `ACCIDENT_ID` int NOT NULL AUTO_INCREMENT,
                            `ACCIDENT_DATE` datetime DEFAULT NULL,
                            `EXPECTED_ENDDATE` datetime DEFAULT NULL,
                            `ACCIDENT_MANAGE` text,
                            `ACCIDENT_UPDATE` datetime DEFAULT NULL,
                            PRIMARY KEY (`ACCIDENT_ID`)
);

-- TEST.HOTPLACE definition

CREATE TABLE HOTPLACE (
                            `HOTPLACE_ID` int NOT NULL AUTO_INCREMENT,
                            `REGION_ID` int NOT NULL,
                            `PARKING_ID` int NOT NULL,
                            `ACCIDENT_ID` int NOT NULL,
                            `WEATHER_ID` int NOT NULL,
                            `UPDATE_TIME` datetime NOT NULL,
                            PRIMARY KEY (`HOTPLACE_ID`),
                            KEY `HOTPLACE_FK` (`PARKING_ID`),
                            KEY `HOTPLACE_FK_1` (`REGION_ID`),
                            KEY `HOTPLACE_FK_2` (`ACCIDENT_ID`),
                            KEY `HOTPLACE_FK_3` (`WEATHER_ID`),
                            CONSTRAINT `HOTPLACE_FK` FOREIGN KEY (`PARKING_ID`) REFERENCES `PARKING` (`PARKING_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
                            CONSTRAINT `HOTPLACE_FK_1` FOREIGN KEY (`REGION_ID`) REFERENCES `REGION` (`REGION_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
                            CONSTRAINT `HOTPLACE_FK_2` FOREIGN KEY (`ACCIDENT_ID`) REFERENCES `ACCIDENT` (`ACCIDENT_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
                            CONSTRAINT `HOTPLACE_FK_3` FOREIGN KEY (`WEATHER_ID`) REFERENCES `WEATHER` (`WEATHER_ID`) ON DELETE RESTRICT ON UPDATE CASCADE
)
;
-- TEST.CLUB definition

CREATE TABLE CLUB (
                        `CLUB_ID` int NOT NULL AUTO_INCREMENT,
                        `CLUB_NAME` varchar(100) NOT NULL,
                        `CLUB_DESCRIPTION` text,
                        `CHATROOM_URL` varchar(100) NOT NULL,
                        `HOTPLACE_ID` int NOT NULL,
                        PRIMARY KEY (`CLUB_ID`),
                        KEY `CLUB_FK` (`HOTPLACE_ID`),
                        CONSTRAINT `CLUB_FK` FOREIGN KEY (`HOTPLACE_ID`) REFERENCES `HOTPLACE` (`HOTPLACE_ID`) ON DELETE RESTRICT ON UPDATE CASCADE
)
;
-- TEST.CLUB_MEMBER definition

CREATE TABLE CLUB_MEMBER (
                               `CLUB_MEMBER_ID` int NOT NULL AUTO_INCREMENT,
                               `MEMBER_ID` varchar(100) NOT NULL,
                               `CLUB_ID` int NOT NULL,
                               PRIMARY KEY (`CLUB_MEMBER_ID`),
                               KEY `CLUB_MEMBER_FK` (`MEMBER_ID`),
                               KEY `CLUB_MEMBER_FK_1` (`CLUB_ID`),
                               CONSTRAINT `CLUB_MEMBER_FK` FOREIGN KEY (`MEMBER_ID`) REFERENCES `MEMBER` (`MEMBER_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
                               CONSTRAINT `CLUB_MEMBER_FK_1` FOREIGN KEY (`CLUB_ID`) REFERENCES `CLUB` (`CLUB_ID`) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO MEMBER (MEMBER_ID,MEMBER_PASSWORD,MEMBER_NAME,MEMBER_PHONENUM) VALUES
    ('rootid','rootpassword','root','010-0000-0000');

INSERT INTO ACCIDENT (ACCIDENT_ID,ACCIDENT_DATE,EXPECTED_ENDDATE,ACCIDENT_MANAGE,ACCIDENT_UPDATE) VALUES
    (1,'2023-06-23 12:12:12','2023-06-23 12:12:12','1','2023-06-23 12:12:12');

INSERT INTO PARKING (PARKING_ID,REALTIME_PARKING,PARKING_NAME,ENTIRE_PARKING,AVAILABLE_PARKING,PARKING_UPDATE) VALUES
    (1,1,'1',1,1,1);

INSERT INTO REGION (REGION_ID,REALTIME_POPULATION,PLACE_CONGESTION,REGIONUPDATE) VALUES
    (1,'1','1','2023-06-23 12:12:12');

INSERT INTO WEATHER (WEATHER_ID,TEMPERTURE,SENSORY_TEMPERATURE,FINEDUST,ULTRA_FINEDUST,PRECIPITATION,WEATHER_UPDATE) VALUES
    (1,1.0,1.0,'1','1',1.0,'2023-06-23 12:12:12');

INSERT INTO HOTPLACE (HOTPLACE_ID,REGION_ID,PARKING_ID,ACCIDENT_ID,WEATHER_ID,UPDATE_TIME) VALUES
    (1,1,1,1,1,'2023-06-23 12:12:12');

INSERT INTO CLUB (CLUB_ID,CLUB_NAME,CLUB_DESCRIPTION,CHATROOM_URL,HOTPLACE_ID) VALUES
    (1,'1','1','1',1);

INSERT INTO CLUB_MEMBER (CLUB_MEMBER_ID,MEMBER_ID,CLUB_ID) VALUES
    (1,'rootid',1);