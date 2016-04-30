CREATE TABLE Yelp_User(
            Yelp_Id varchar(5) PRIMARY KEY,
            Email_Id varchar(50) NOT NULL,
            Birthplace varchar(50) NOT NULL,
            Birthdate date NOT NULL,
            Gender char(1) CONSTRAINT rightGender check (Gender = 'M' or Gender = 'F') NOT NULL,
            First_Name varchar(50) NOT NULL,
            Last_Name varchar(50) NOT NULL
            );

CREATE TABLE Business_Category(
Business_Cat_Id varchar(50) PRIMARY KEY,
Name varchar(50) NOT NULL);

CREATE TABLE Business(
Business_Id varchar(50) PRIMARY KEY,
Business_Name varchar(50) NOT NULL,
City varchar(25) NOT NULL,
State varchar(50) NOT NULL,
Phone_No varchar(50) NOT NULL,
Status varchar(1) CONSTRAINT open check (Status = 'T' or Status = 'F') NOT NULL,
Business_Cat_Id varchar(50) NOT NULL, 
FOREIGN KEY (Business_Cat_Id)REFERENCES Business_Category(Business_Cat_Id)
);

CREATE TABLE Reviews(
Review_Id varchar(50) PRIMARY KEY,
Rating NUMBER(2) CHECK (Rating >=1 and Rating <=10) NOT NULL,
Author varchar(5) NOT NULL,
Publish_Date TIMESTAMP NOT NULL,
Friend_list_vote varchar(5) NOT NULL,
Review_type varchar(5) NOT NULL,
Business_Id varchar(5) NOT NULL,
Funny NUMBER(1)NOT NULL,
Cool NUMBER(1) NOT NULL,
Useful NUMBER(1) NOT NULL,
FOREIGN KEY (Author) REFERENCES Yelp_User(Yelp_Id),
FOREIGN KEY (Business_Id) REFERENCES Business(Business_Id)
);

CREATE TABLE PHOTO(
    PHOTO_ID VARCHAR(50) PRIMARY KEY,
    AUTHOR VARCHAR(5) NOT NULL,
    LOCATION VARCHAR(50) NOT NULL,
    FOREIGN KEY (AUTHOR) REFERENCES YELP_USER(YELP_ID)
);

CREATE TABLE FRIENDS(
    USERS_ID VARCHAR(5) NOT NULL,
    FRIENDS_ID VARCHAR(5),
    FOREIGN KEY (FRIENDS_ID) REFERENCES YELP_USER(YELP_ID)
);

CREATE TABLE LIST_OF_FRIENDS_COMPLIMENTED(
    USER_ID VARCHAR(5) NOT NULL,
    FRIEND_ID VARCHAR(5) NOT NULL,
    COMPLIMENTED VARCHAR(1) NOT NULL,
    FOREIGN KEY (USER_ID) REFERENCES YELP_USER(YELP_ID),
    FOREIGN KEY (FRIEND_ID) REFERENCES YELP_USER(YELP_ID)
);

CREATE TABLE REVIEW_AUTHOR(
    AUTHOR VARCHAR(5) NOT NULL,
    REVIEW_ID VARCHAR(50) NOT NULL,
    FOREIGN KEY (AUTHOR) REFERENCES YELP_USER(YELP_ID),
    FOREIGN KEY (REVIEW_ID) REFERENCES REVIEWS(REVIEW_ID)
);

CREATE TABLE REVIEW_WRITTEN(
    AUTHOR VARCHAR(5) NOT NULL,
    BUSINESS_ID VARCHAR(50) NOT NULL,
    REVIEW_ID VARCHAR(50) NOT NULL,
    FOREIGN KEY (AUTHOR) REFERENCES YELP_USER(YELP_ID),
    FOREIGN KEY (BUSINESS_ID) REFERENCES BUSINESS(BUSINESS_ID),
    FOREIGN KEY (REVIEW_ID) REFERENCES REVIEWS(REVIEW_ID)
);

CREATE TABLE BUSINESS_HAS_PHOTOS(
    BUSINESS_ID VARCHAR(50) NOT NULL,
    PHOTO_ID VARCHAR(50) NOT NULL,
    FOREIGN KEY (BUSINESS_ID) REFERENCES BUSINESS(BUSINESS_ID),
    FOREIGN KEY (PHOTO_ID) REFERENCES PHOTO(PHOTO_ID)
);    
  
CREATE TABLE BUSINESS_HAS_CATEGORY(
    BUSINESS_ID VARCHAR(50) NOT NULL,
    BUSINESS_CAT_ID VARCHAR(50) NOT NULL,
    FOREIGN KEY (BUSINESS_ID) REFERENCES BUSINESS(BUSINESS_ID),
    FOREIGN KEY (BUSINESS_CAT_ID) REFERENCES BUSINESS_CATEGORY(BUSINESS_CAT_ID)
);

CREATE TABLE REVIEW_HAS_CONTENT(
    CONTENT_ID VARCHAR(50) NOT NULL,
    REVIEW_ID VARCHAR(50) NOT NULL,
    FOREIGN KEY (REVIEW_ID) REFERENCES REVIEWS(REVIEW_ID)
);

CREATE TABLE USER_REVIEWED_AS_THREE_KIND(
    AUTHOR VARCHAR(5) NOT NULL,
    REVIEW_ID VARCHAR(5) NOT NULL,
    FUNNY VARCHAR(1),
    COOL VARCHAR(1),
    USEFUL VARCHAR(1),
    FOREIGN KEY (AUTHOR) REFERENCES YELP_USER(YELP_ID),
    FOREIGN KEY (REVIEW_ID) REFERENCES REVIEWS(REVIEW_ID)
);

CREATE TABLE YELP_PHOTO(
    PHOTO_ID VARCHAR(50) NOT NULL,
    AUTHOR VARCHAR(5) NOT NULL,
    BUSINESS_ID VARCHAR(50) NOT NULL,
    FOREIGN KEY (PHOTO_ID) REFERENCES PHOTO(PHOTO_ID),
    FOREIGN KEY (AUTHOR) REFERENCES YELP_USER(YELP_ID),
    FOREIGN KEY (BUSINESS_ID) REFERENCES BUSINESS(BUSINESS_ID)
);

insert into Yelp_User values ('Y1','john@yahoo.com','LAKECITY FL 32056',TO_DATE('12/12/1992','MM/DD/YYYY'),'M','John','Smith');
insert into Yelp_User values ('Y2','juan@gmail.com','Adak,AK 99546',TO_DATE('2/7/1988','MM/DD/YYYY'),'M','Juan','Carlos');
insert into Yelp_User values ('Y3','Jane@gmail.com','VERNON HILLS,IL 60061',TO_DATE('6/1/1980','MM/DD/YYYY'),'F','Jane','Chapel');
insert into Yelp_User values ('Y4','adi@yahoo.com','SAN FRANCISCO,CA 94102',TO_DATE('4/12/1964','MM/DD/YYYY'),'M','Aditya','Awasthi');
insert into Yelp_User values ('Y5','james@hotmail.com','NEW YORK ,NY 10010',TO_DATE('5/5/1991','MM/DD/YYYY'),'M','James','Williams');
insert into Yelp_User values ('Y6','mike@yahoo.com','CEDAR FALLS, NC 27230',TO_DATE('3/1/1988','MM/DD/YYYY'),'M','Mike','Brown');
insert into Yelp_User values ('Y7','bob@yahoo.com','FISHERS ISLAND,NY 06390',TO_DATE('2/19/1970','MM/DD/YYYY'),'M','Bob ','Jones');
insert into Yelp_User values ('Y8','wei@gmail.com','LAS VEGAS,NV 89030',TO_DATE('3/18/1975','MM/DD/YYYY'),'F','Wei ','Zhang');
insert into Yelp_User values ('Y9','mark@gmail.com','LOS ANGELES,CA 90007',TO_DATE('11/2/1945','MM/DD/YYYY'),'M','Mark','Davis');
insert into Yelp_User values ('Y10','daniel@yahoo.com','CALDWELL,NJ 07004',TO_DATE('5/10/1984','MM/DD/YYYY'),'M','Daniel','Garcia');
insert into Yelp_User values ('Y11','maria@hotmail.com','LOS ANGELES,CA 90007',TO_DATE('8/12/1985','MM/DD/YYYY'),'F','Maria','Rodriguez');
insert into Yelp_User values ('Y12','freya@yahoo.com','CLIFFSIDE PARK ,NJ 07010',TO_DATE('10/5/1990','MM/DD/YYYY'),'F','Freya','Wilson');
insert into Yelp_User values ('Y13','kell@gmail.com','REDONDO BEACH,CA 90278',TO_DATE('11/27/1995','MM/DD/YYYY'),'F','Kelley','Abraham');        

insert into Business_Category values('BCT1','Amusement Parks');
insert into Business_Category values('BCT2','Gymnastics');
insert into Business_Category values('BCT3','Architects');
insert into Business_Category values('BCT4','Windshield');
insert into Business_Category values('BCT5','Breakfast & Brunch');
insert into Business_Category values('BCT6','Career Counseling');
insert into Business_Category values('BCT7','Coffee Shops');
insert into Business_Category values('BCT8','Food and More');
insert into Business_Category values('BCT9','Pool Cleaners');
insert into Business_Category values('BCT10','Bars');
insert into Business_Category values('BCT11','Burgers');

insert into Business values('B1','Big Surf','San Jose','CA','(520) 622-6400','T','BCT1');
insert into Business values('B2','AirBorne COFFEE','San Jose','CA','408) 524-3580','T','BCT2');
insert into Business values('B3','Pedley Richard Architect','San Jose','CA','(419)-244-5200','T','BCT3');
insert into Business values('B4','Safelite AutoGlass','San Jose','CA','(520)-465-5225','T','BCT4');
insert into Business values('B5','SMITH THOMSON ','San Jose','CA','(855)-808-1480','T','BCT5');
insert into Business values('B6','Catch Your Big Break','San Jose','CA',' (408)-827-8383','T','BCT6');
insert into Business values('B7','Bay Area Coffee Shop','Santa Clara ','CA','(408)-876 7785','T','BCT7');
insert into Business values('B8','China  Coffee Toffee ','Santa Clara ','CA','(408)-261-9000','T','BCT8');
insert into Business values('B9','Hastings Water Works','Brecksville','OH','(440)-832-7700','T','BCT9');
insert into Business values('B10','The Cinebar','Torrance','CA','(408)-465-8308','T','BCT10');
insert into Business values('B11','In-N-Out Burger','San Jose','CA','(408)-804-8782','F','BCT11');
insert into Business values('B12','Coffee Bar & Bistro','Santa Clara','CA','(408)-465-8208','T','BCT10');
insert into Business values('B13','Renegades','Santa Clara','CA','(408)-465-8108','T','BCT10');
insert into Business values('B14','Alex`s 49er Inn','Columbus','OH','(419)-465-8018','T','BCT10');
insert into Business values('B15','Red Stag Lounge','Brecksville','OH','(419)-465-8028','T','BCT10');
insert into Business values('B16','JJ`s Blues','Brecksville','OH','(419)-465-8108','T','BCT10');
insert into Business values('B17','The Bears Cocktails','Vienna','VA','(844)-465-8028','T','BCT10');
insert into Business values('B18','Trials Pub','Vienna','VA','(844)-465-8038','T','BCT10');
insert into Business values('B19','Santa Cruz Wine Bar','Vienna','VA','(844)-465-8048','T','BCT10');
insert into Business values('B20','Firehouse No 1 Gastropub','Tempe','AZ','(520)-465-8058','T','BCT10');
insert into Business values('B21','Original Gravity Public House','Tempe','AZ','(520)-465-8068','T','BCT10');
insert into Business values('B22','Hobee`s','San Jose','CA','(408)-465-8078','F','BCT5');
insert into Business values('B23','The Table','San Jose','CA','(408)-465-8908','T','BCT5');
insert into Business values('B24','Top Nosh CafÈ','San Jose','CA','(408)-465-8098','T','BCT5');
insert into Business values('B25','Breakfast Place','San Jose','CA','(408)-465-8808','F','BCT5');
insert into Business values('B26','Cafe Rosalena','San Jose','CA','(408)-465-8708','F','BCT5');
insert into Business values('B27','Southern Kitchen','San Jose','CA','(408)-465-8608','F','BCT5');
insert into Business values('B28','Holder`s Country Inn','San Jose','CA','(408)-465-8508','F','BCT5');

insert into Reviews values ('R1','2','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B1','1','0','0');
insert into Reviews values ('R2','3','Y2',to_timestamp_tz('Oct-02-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B2','0','1','0');
insert into Reviews values ('R3','2','Y3',to_timestamp_tz('Oct-03-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B3','0','0','1');
insert into Reviews values ('R4','2','Y4',to_timestamp_tz('Oct-11-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B4','1','0','0');
insert into Reviews values ('R5','4','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B5','0','1','0');
insert into Reviews values ('R6','4','Y6',to_timestamp_tz('Oct-02-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B6','0','0','1');
insert into Reviews values ('R7','3','Y7',to_timestamp_tz('Oct-03-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B7','1','0','0');
insert into Reviews values ('R8','2','Y8',to_timestamp_tz('Oct-04-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y10','R','B8','0','1','0');
insert into Reviews values ('R9','1','Y9',to_timestamp_tz('Oct-05-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B9','0','0','1');
insert into Reviews values ('R10','1','Y10',to_timestamp_tz('Oct-06-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B10','1','0','0');
insert into Reviews values ('R11','2','Y1',to_timestamp_tz('Oct-07-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B11','0','1','0');
insert into Reviews values ('R12','2','Y2',to_timestamp_tz('Oct-08-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B1','1','0','0');
insert into Reviews values ('R13','2','Y3',to_timestamp_tz('Oct-09-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B2','0','1','0');
insert into Reviews values ('R14','3','Y4',to_timestamp_tz('Oct-10-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B3','0','0','1');
insert into Reviews values ('R15','4','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B4','1','0','0');
insert into Reviews values ('R16','4','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B5','0','1','0');
insert into Reviews values ('R17','1','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B6','0','0','1');
insert into Reviews values ('R18','2','Y7',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B7','1','0','0');
insert into Reviews values ('R19','3','Y8',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y10','R','B8','0','1','0');
insert into Reviews values ('R20','4','Y9',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B9','0','0','1');
insert into Reviews values ('R21','4','Y10',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B10','1','0','0');
insert into Reviews values ('R22','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B12','0','1','0');
insert into Reviews values ('R23','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B13','0','0','1');
insert into Reviews values ('R24','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B14','1','0','0');
insert into Reviews values ('R25','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B15','0','1','0');
insert into Reviews values ('R26','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B16','0','0','1');
insert into Reviews values ('R27','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B17','1','0','0');
insert into Reviews values ('R28','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B18','0','1','0');
insert into Reviews values ('R29','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B19','0','0','1');
insert into Reviews values ('R30','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B20','1','0','0');
insert into Reviews values ('R31','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B21','0','1','0');
insert into Reviews values ('R32','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B22','0','0','1');
insert into Reviews values ('R33','2','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B1','1','0','0');
insert into Reviews values ('R34','3','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B2','0','1','0');
insert into Reviews values ('R35','2','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B3','0','0','1');
insert into Reviews values ('R36','2','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B4','1','0','0');
insert into Reviews values ('R37','4','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B5','0','1','0');
insert into Reviews values ('R38','4','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B6','0','0','1');
insert into Reviews values ('R39','2','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B1','1','0','0');
insert into Reviews values ('R40','3','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B2','0','1','0');
insert into Reviews values ('R41','2','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B3','0','0','1');
insert into Reviews values ('R42','2','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B4','1','0','0');
insert into Reviews values ('R43','4','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B5','0','1','0');
insert into Reviews values ('R44','4','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B6','0','0','1');
insert into Reviews values ('R45','2','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B1','1','0','0');
insert into Reviews values ('R46','3','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B2','0','1','0');
insert into Reviews values ('R47','2','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B3','0','0','1');
insert into Reviews values ('R48','2','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B4','1','0','0');
insert into Reviews values ('R49','4','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B5','0','1','0');
insert into Reviews values ('R50','4','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B6','0','0','1');
insert into Reviews values ('R51','2','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B1','1','0','0');
insert into Reviews values ('R52','3','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B2','0','1','0');
insert into Reviews values ('R53','2','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B3','0','0','1');
insert into Reviews values ('R54','2','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B4','1','0','0');
insert into Reviews values ('R55','4','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B5','0','1','0');
insert into Reviews values ('R56','4','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B6','0','0','1');
insert into Reviews values ('R57','4','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B23','0','0','1');
insert into Reviews values ('R58','4','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B23','0','1','0');
insert into Reviews values ('R59','4','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B23','0','0','1');
insert into Reviews values ('R60','4','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B23','1','0','0');
insert into Reviews values ('R61','4','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B23','0','1','0');
insert into Reviews values ('R62','4','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B23','0','0','1');
insert into Reviews values ('R63','4','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B24','1','0','0');
insert into Reviews values ('R64','4','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B24','0','1','0');
insert into Reviews values ('R65','4','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B24','0','0','1');
insert into Reviews values ('R66','4','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B24','1','0','0');
insert into Reviews values ('R67','4','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B24','0','1','0');
insert into Reviews values ('R68','4','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B24','0','0','1');
insert into Reviews values ('R69','4','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B25','1','0','0');
insert into Reviews values ('R70','4','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B25','0','1','0');
insert into Reviews values ('R71','4','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B25','0','0','1');
insert into Reviews values ('R72','4','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B25','1','0','0');
insert into Reviews values ('R73','4','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B25','0','1','0');
insert into Reviews values ('R74','4','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B25','0','0','1');
insert into Reviews values ('R75','4','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B26','1','0','0');
insert into Reviews values ('R76','4','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B26','0','1','0');
insert into Reviews values ('R77','4','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B26','0','0','1');
insert into Reviews values ('R78','4','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B26','1','0','0');
insert into Reviews values ('R79','4','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B26','0','1','0');
insert into Reviews values ('R80','4','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B26','0','0','1');
insert into Reviews values ('R81','4','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B27','1','0','0');
insert into Reviews values ('R82','5','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B27','0','1','0');
insert into Reviews values ('R83','5','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B27','0','0','1');
insert into Reviews values ('R84','5','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B27','1','0','0');
insert into Reviews values ('R85','5','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B27','0','1','0');
insert into Reviews values ('R86','5','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B22','0','0','1');
insert into Reviews values ('R87','5','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B22','1','0','0');
insert into Reviews values ('R88','5','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B22','0','1','0');
insert into Reviews values ('R89','5','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B22','0','0','1');
insert into Reviews values ('R90','5','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B28','1','0','0');
insert into Reviews values ('R91','5','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B28','0','1','0');
insert into Reviews values ('R92','5','Y7',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B28','0','0','1');
insert into Reviews values ('R93','5','Y8',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y10','R','B28','1','0','0');
insert into Reviews values ('R94','5','Y9',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B28','0','1','0');
