CREATE TABLE Yelp_User(
			Yelp_Id varchar(5) PRIMARY KEY,
			Email_Id varchar(50) NOT NULL,
			Birthplace varchar(50) NOT NULL,
			Birthdate date NOT NULL,
			Gender char(1) NOT NULL,
			First_Name varchar(50) NOT NULL,
			Last_Name varchar(50) NOT NULL
			);

CREATE TABLE Business_Category(
Business_Cat_Id varchar(50) PRIMARY KEY,
Name varchar(50) NOT NULL);

CREATE TABLE Business(
Business_Id varchar(50) PRIMARY KEY,
Business_Name varchar(50) NOT NULL,
City varchar(50) NOT NULL,
State varchar(50) NOT NULL,
Phone_No varchar(50) NOT NULL,
Open varchar(1) NOT NULL,
Business_Cat_Id varchar(50), 
FOREIGN KEY (Business_Cat_Id)REFERENCES Business_Category(Business_Cat_Id)
);

CREATE TABLE Reviews(
Review_Id varchar(50) PRIMARY KEY,
Rating NUMBER(5) NOT NULL,
Author varchar(5) NOT NULL,
Publish_Date date NOT NULL,
Friend_list_vote varchar(5) NOT NULL,
Review_type varchar(5) NOT NULL,
Business_Id varchar(5) NOT NULL,
Funny NUMBER(1)NOT NULL,
Cool NUMBER(1) NOT NULL,
Useful NUMBER(1) NOT NULL,
FOREIGN KEY (Author) REFERENCES Yelp_User(Yelp_Id),
FOREIGN KEY (Business_Id) REFERENCES Business(Business_Id)
);