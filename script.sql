DROP TABLE IF EXISTS COUNTER;
DROP TABLE IF EXISTS USERS CASCADE;
DROP TABLE IF EXISTS FACULTIES CASCADE;
DROP TABLE IF EXISTS LOSTSTUFF;
DROP TABLE IF EXISTS FOUNDSTUFF;
DROP TABLE IF EXISTS GAMEFRIEND;
DROP TABLE IF EXISTS DATASHAREDHOUSE CASCADE;
DROP TABLE IF EXISTS DATASEARCHEDHOUSE CASCADE;
DROP TABLE IF EXISTS RESTAURANTS CASCADE;
DROP TABLE IF EXISTS CAMPUSLOCATIONS CASCADE;
DROP TABLE IF EXISTS RESTAURANTMENUS CASCADE;
DROP TABLE IF EXISTS SPECIALTUTORS;
DROP TABLE IF EXISTS SPECIALSTUDENTS;
DROP TABLE IF EXISTS CLUBACTIVITIES;
DROP TABLE IF EXISTS ITUACTIVITIES;
DROP TABLE IF EXISTS SPORTACTIVITIES;
DROP TABLE IF EXISTS SHAREDBOOKS;
DROP TABLE IF EXISTS SHAREDLESSONNOTES;


CREATE TABLE COUNTER (N INTEGER);


INSERT INTO COUNTER (N) VALUES (0);


CREATE TABLE FACULTIES (
    ID SERIAL PRIMARY KEY NOT NULL,
    FACULTYNAME VARCHAR(100) NOT NULL,
    FACULTYCODE VARCHAR(30) NOT NULL
);

CREATE TABLE USERS (
    ID SERIAL PRIMARY KEY NOT NULL,
    USERNAME VARCHAR(30) NOT NULL,
    PASSWORD VARCHAR(500) NOT NULL,
    EMAIL VARCHAR(30) NOT NULL,
    NAME VARCHAR(30) NOT NULL,
    SURNAME VARCHAR(30) NOT NULL,
    FACULTYID INTEGER REFERENCES FACULTIES(ID) ON DELETE CASCADE
);


INSERT INTO FACULTIES(FACULTYNAME, FACULTYCODE) VALUES ('Computer and Informatics Faculty', 'BB');
INSERT INTO FACULTIES(FACULTYNAME, FACULTYCODE) VALUES ('Civil Engineering Faculty', 'IN');
INSERT INTO FACULTIES(FACULTYNAME, FACULTYCODE) VALUES ('Electric-Electronic Faculty', 'EE');
INSERT INTO FACULTIES(FACULTYNAME, FACULTYCODE) VALUES ('Mines Faculty', 'MD');
INSERT INTO FACULTIES(FACULTYNAME, FACULTYCODE) VALUES ('Architecture Faculty', 'MM');
INSERT INTO FACULTIES(FACULTYNAME, FACULTYCODE) VALUES ('Machine Faculty', 'MK');

INSERT INTO USERS(USERNAME, PASSWORD, EMAIL, NAME, SURNAME, FACULTYID) VALUES ('admin', '$6$rounds=656000$NhjGHwap0iYnsrNW$Y0sK0vHaShrBy0Q62GN3TIMQFdcDV7u98tjntyJUfN4EzDGKCr28UaG838uHaRNVCATFomj.d6gc.a1107lZm1', 'admin@gmail.com', 'server', 'admin', 1);





CREATE TABLE SHAREDBOOKS(
    ID SERIAL PRIMARY KEY NOT NULL ,
    NAMEOFBOOK VARCHAR(100) NOT NULL ,
    LESSONNAME VARCHAR(50) NOT NULL ,
    LESSONCODE VARCHAR(50) NOT NULL ,
    TYPEOFSHARE VARCHAR(80) NOT NULL ,
    PRICE INTEGER,
    USERID INTEGER REFERENCES USERS(ID) ON DELETE CASCADE
);

CREATE TABLE SHAREDLESSONNOTES(
  ID SERIAL PRIMARY KEY NOT NULL,
  NAMEOFNOTES VARCHAR(100) NOT NULL,
  LESSONNAME VARCHAR(50) NOT NULL ,
  LESSONCODE VARCHAR(50) NOT NULL ,
  TEACHERNAME VARCHAR(100) NOT NULL ,
  USERID INTEGER REFERENCES USERS(ID) ON DELETE CASCADE
);

CREATE TABLE LOSTSTUFF (
    ID SERIAL PRIMARY KEY NOT NULL,
    STUFFDESC VARCHAR(300) NOT NULL,
    POSSIBLELOC VARCHAR(50) NOT NULL,
    POSSIBLEDATE DATE NOT NULL,
    OWNERNAME VARCHAR(50) NOT NULL,
    OWNERMAIL VARCHAR(50) NOT NULL,
    OWNERPHONE VARCHAR(15) NOT NULL,
    USERID INTEGER REFERENCES USERS(ID) ON DELETE CASCADE
);


--INSERT INTO LOSTSTUFF(STUFFDESC, POSSIBLELOC, POSSIBLEDATE, OWNERNAME, OWNERMAIL, OWNERPHONE) VALUES ('KAYIP', 'MED', '2017-10-13', 'Sercan', 'sahanse@itu.edu.tr', '+905350000000');


CREATE TABLE FOUNDSTUFF (
    ID SERIAL PRIMARY KEY NOT NULL,
    STUFFDESC VARCHAR(300) NOT NULL,
    CURRENTLOC VARCHAR(50) NOT NULL,
    FINDINGDATE DATE NOT NULL,
    FOUNDERNAME VARCHAR(50) NOT NULL,
    FOUNDERMAIL VARCHAR(50) NOT NULL,
    FOUNDERPHONE VARCHAR(15) NOT NULL,
    USERID INTEGER REFERENCES USERS(ID) ON DELETE CASCADE
);


--INSERT INTO FOUNDSTUFF(STUFFDESC, CURRENTLOC, FINDINGDATE, FOUNDERNAME, FOUNDERMAIL, FOUNDERPHONE) VALUES ('KAYIP', 'MED', '2017-10-13', 'Sercan', 'sahanse@itu.edu.tr', '+905350000000');


CREATE TABLE GAMEFRIEND(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(80) NOT NULL,
    TYPE VARCHAR(30) NOT NULL,
    GAMEDATE DATE NOT NULL,
    LOCATION VARCHAR(80) NOT NULL,
    PLAYERNUMBER INTEGER NOT NULL,
    DESCRIPTION VARCHAR(120) NOT NULL,
    USERID INTEGER REFERENCES USERS(ID) ON DELETE CASCADE
);

-- Sample entries to GAMEFRIEND Entity.
INSERT INTO GAMEFRIEND (NAME, TYPE, GAMEDATE, LOCATION, PLAYERNUMBER, DESCRIPTION, USERID) VALUES('FIFA 18', 'Video Game', '2017-12-4', 'Levent', 4, 'Come with your couple', 1);
INSERT INTO GAMEFRIEND (NAME, TYPE, GAMEDATE, LOCATION, PLAYERNUMBER, DESCRIPTION, USERID) VALUES('UNO', 'Table Game', '2017-12-1', 'EEB Kantini', 6, 'Come and have fun with us', 1);
INSERT INTO GAMEFRIEND (NAME, TYPE, GAMEDATE, LOCATION, PLAYERNUMBER, DESCRIPTION, USERID) VALUES('Hal' || U&'\0131' || 'saha Futbol Ma' || U&'\00E7' || U&'\0131', 'Sport Game', '2017-12-2', 'Ayaza' || U&'\011F' || 'a Hal' || U&'\0131' || 'saha', 12, 'Special talents are not required', 1);

CREATE TABLE DATASHAREDHOUSE(
    ID SERIAL PRIMARY KEY NOT NULL,
    LOCATION VARCHAR(80) NOT NULL,
    RENTPRICE INTEGER NOT NULL,
    NUMBEROFPEOPLE INTEGER NOT NULL,
    NUMBEROFROOM VARCHAR (10) NOT NULL,
    DESCRIPTION VARCHAR (300) NOT NULL,
    USERID INTEGER REFERENCES USERS(ID) ON DELETE CASCADE
);


--INSERT INTO DATASHAREDHOUSE(LOCATION, RENTPRICE, NUMBEROFPEOPLE,NUMBEROFROOM,DESCRIPTION,GENDER) VALUES ('Levent', '1500', '2','3+1','aa','Male' );

CREATE TABLE DATASEARCHEDHOUSE(
    ID SERIAL PRIMARY KEY NOT NULL,
    LOCATION VARCHAR(80) NOT NULL,
    MINRENTPRICE INTEGER NOT NULL,
    MAXRENTPRICE INTEGER NOT NULL,
    DESCRIPTION VARCHAR (300) NOT NULL,
    USERID INTEGER REFERENCES USERS(ID) ON DELETE CASCADE
);

--INSERT INTO DATASEARCHEDHOUSE(LOCATION, MINRENTPRICE, MAXRENTPRICE,DESCRIPTION,NUMBEROFROOMS,GENDER) VALUES ('Levent', '300', '500', 'aa','3+1','Male' );

CREATE TABLE CAMPUSLOCATIONS (
    ID SERIAL PRIMARY KEY NOT NULL,
    CAMPUSNAME  VARCHAR(50) NOT NULL,
    CAMPUSDISTRICT VARCHAR(50) NOT NULL
);

INSERT INTO CAMPUSLOCATIONS(CAMPUSNAME, CAMPUSDISTRICT) VALUES ('Ayaza' || U&'\011F' || 'a', 'Maslak');
INSERT INTO CAMPUSLOCATIONS(CAMPUSNAME, CAMPUSDISTRICT) VALUES ('Ma' || U&'\00E7' || 'ka', 'Taksim');
INSERT INTO CAMPUSLOCATIONS(CAMPUSNAME, CAMPUSDISTRICT) VALUES ('Ta' || U&'\015F' || 'k' || U&'\0131' || U&'\015F' || 'la', 'Taksim');
INSERT INTO CAMPUSLOCATIONS(CAMPUSNAME, CAMPUSDISTRICT) VALUES ('Tuzla', 'Tuzla');


CREATE TABLE RESTAURANTS (
    ID SERIAL PRIMARY KEY NOT NULL,
    RESTAURANTNAME VARCHAR(100) NOT NULL,
    LOCATIONID INTEGER REFERENCES CAMPUSLOCATIONS(ID) ON DELETE CASCADE NOT NULL,
    MENUTYPE VARCHAR(40) NOT NULL,
    RESTAURANTPOINT FLOAT NOT NULL,
    OPENINGTIME TIME  NOT NULL,
    CLOSINGTIME TIME NOT NULL,
    OWNEREMAIL VARCHAR(30) NOT NULL,
    OWNERPHONENUMBER VARCHAR(15) NOT NULL,
    SERVICETYPE VARCHAR(20) NOT NULL,
    VOTES FLOAT DEFAULT 0
);

INSERT INTO RESTAURANTS(RESTAURANTNAME ,LOCATIONID, MENUTYPE, RESTAURANTPOINT, OPENINGTIME, CLOSINGTIME, OWNEREMAIL, OWNERPHONENUMBER, SERVICETYPE )
  VALUES('Burger Restaurant' , 1, 'Fast Food', 5, '23:30', '00:00', 'huseyinuzum@gmail.com', '05456788890', 'Self' );

CREATE TABLE RESTAURANTMENUS (
    ID SERIAL PRIMARY KEY NOT NULL,
    FOODTYPE  VARCHAR(40) NOT NULL,
    FOODNAME VARCHAR(40) NOT NULL,
    FOODPRICE VARCHAR(40) NOT NULL,
    OWNERRESTAURANTID INTEGER REFERENCES RESTAURANTS(ID) ON DELETE CASCADE NOT NULL
);

INSERT INTO RESTAURANTMENUS(FOODTYPE, FOODNAME, FOODPRICE, OWNERRESTAURANTID) VALUES ('Fast Food', 'Hamburger', '100', 1);
INSERT INTO RESTAURANTMENUS(FOODTYPE, FOODNAME, FOODPRICE, OWNERRESTAURANTID) VALUES ('Drink', 'Water', '1', 1);


CREATE TABLE SPECIALTUTORS (
    ID SERIAL PRIMARY KEY NOT NULL,
    SUBJECT VARCHAR(20) NOT NULL,
    FULLNAME VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(30) NOT NULL,
    PHONENUMBER VARCHAR(15) NOT NULL,
    USERID INTEGER REFERENCES USERS(ID) ON DELETE CASCADE
);

CREATE TABLE SPECIALSTUDENTS (
    ID SERIAL PRIMARY KEY NOT NULL,
    SUBJECT VARCHAR(20) NOT NULL,
    FULLNAME VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(30) NOT NULL,
    PHONENUMBER VARCHAR(15) NOT NULL,
    USERID INTEGER REFERENCES USERS(ID) ON DELETE CASCADE
);

CREATE TABLE CLUBACTIVITIES (
    ID SERIAL PRIMARY KEY NOT NULL,
    NAME VARCHAR(40) NOT NULL,
    CLUBNAME VARCHAR(40) NOT NULL,
    ACTIVITYDATE DATE NOT NULL,
    ACTIVITYTIME TIME NOT NULL,
    LOCATION VARCHAR(40) NOT NULL,
    DESCRIPTION VARCHAR(80) NOT NULL,
    USERID INTEGER REFERENCES USERS(ID) ON DELETE CASCADE
);

-- Sample entries for CLUBACTIVITIES Entity
INSERT INTO CLUBACTIVITIES (NAME, CLUBNAME, ACTIVITYDATE, ACTIVITYTIME, LOCATION, DESCRIPTION, USERID) VALUES('Scheduled Meeting', 'IEEE Computer Society', '2017-12-4', '17:00:00', 'EEB 1302', 'Some important topics will be discussed', 1);
INSERT INTO CLUBACTIVITIES (NAME, CLUBNAME, ACTIVITYDATE, ACTIVITYTIME, LOCATION, DESCRIPTION, USERID) VALUES('Python Training', 'Free Software Club', '2018-1-10', '18:30:00', 'EEB 4401', 'Python Training 1st lesson', 1);
INSERT INTO CLUBACTIVITIES (NAME, CLUBNAME, ACTIVITYDATE, ACTIVITYTIME, LOCATION, DESCRIPTION, USERID) VALUES('Comedy Film Watching', 'Cinema Club', '2017-12-4', '20:00:00', 'MED', 'A comedy film will be choosed and watched', 1);


CREATE TABLE SPORTACTIVITIES (
    ID SERIAL PRIMARY KEY NOT NULL,
    NAME VARCHAR(40) NOT NULL,
    SPORTNAME VARCHAR(40) NOT NULL,
    ACTIVITYDATE DATE NOT NULL,
    ACTIVITYTIME TIME NOT NULL,
    LOCATION VARCHAR(40) NOT NULL,
    DESCRIPTION VARCHAR(80) NOT NULL,
    USERID INTEGER REFERENCES USERS(ID) ON DELETE CASCADE
);

-- Sample entries for SPORTACTIVITIES Entity
INSERT INTO SPORTACTIVITIES (NAME, SPORTNAME, ACTIVITYDATE, ACTIVITYTIME, LOCATION, DESCRIPTION, USERID) VALUES('Fenerbahce-Galatasaray Derby', 'Football', '2018-4-12', '19:30:00', 'Ulker Stadyumu', 'Passolig card is required', 1);
INSERT INTO SPORTACTIVITIES (NAME, SPORTNAME, ACTIVITYDATE, ACTIVITYTIME, LOCATION, DESCRIPTION, USERID) VALUES('Besiktas Champions League Match', 'Football', '2018-2-1', '21:45:00', 'Vodafone Arena', 'Quarter Final Match', 1);
INSERT INTO SPORTACTIVITIES (NAME, SPORTNAME, ACTIVITYDATE, ACTIVITYTIME, LOCATION, DESCRIPTION, USERID) VALUES('Fenerbahce Final Four Match', 'Basketball', '2018-5-9', '19:30:00', 'Belgrad', 'Olympiacos, Real Madrid, Fenerbahce or CSKA', 1);




CREATE TABLE ITUACTIVITIES (
    ID SERIAL PRIMARY KEY NOT NULL,
    NAME VARCHAR(40) NOT NULL,
    SPECIALPARTICIPANT VARCHAR(40) NOT NULL,
    ACTIVITYDATE DATE NOT NULL,
    ACTIVITYTIME TIME NOT NULL,
    LOCATION VARCHAR(40) NOT NULL,
    DESCRIPTION VARCHAR(80) NOT NULL,
    USERID INTEGER REFERENCES USERS(ID) ON DELETE CASCADE
);

-- Sample entries for ITUACTIVITIES Entity
INSERT INTO ITUACTIVITIES (NAME, SPECIALPARTICIPANT, ACTIVITYDATE, ACTIVITYTIME, LOCATION, DESCRIPTION, USERID) VALUES('Mustafa Inan Anma Toplantisi', 'Rektor', '2017-12-8', '14:30:00', 'SDKM Salonu', 'Etkinlik 2 saattir', 1);
INSERT INTO ITUACTIVITIES (NAME, SPECIALPARTICIPANT, ACTIVITYDATE, ACTIVITYTIME, LOCATION, DESCRIPTION, USERID) VALUES('Toyota HYBRID Kampuste', 'Oguzhan Orhan', '2017-12-6', '17:00:00', 'Otomotiv Lab', 'Etkinlige herkes davetlidir', 1);
INSERT INTO ITUACTIVITIES (NAME, SPECIALPARTICIPANT, ACTIVITYDATE, ACTIVITYTIME, LOCATION, DESCRIPTION, USERID) VALUES('MIAM Music and Expression Seminars', 'Golo Follmer', '2017-12-7', '17:30:00', 'Macka Campus', 'All the students are welcomed', 1);

