SELECT * FROM (SELECT A.RATING,A.BUSINESS_ID,B.BUSINESS_NAME,B.BUSINESS_CAT_ID FROM (SELECT AVG(RATING)AS RATING,BUSINESS_ID FROM REVIEWS GROUP BY BUSINESS_ID ORDER BY RATING DESC) A , BUSINESS B
WHERE A.BUSINESS_ID = B.BUSINESS_ID AND A.RATING =5) FIVE_STAR_BUSINESS,(SELECT * FROM(SELECT * FROM(SELECT FLOOR(MONTHS_BETWEEN(SYSDATE,BIRTHDATE)/12) AS AGE,YELP_ID FROM YELP_USER)  WHERE AGE <=25 AND AGE >=15 ORDER BY AGE DESC) C ,REVIEWS R WHERE R.AUTHOR = C.YELP_ID ) AGED_USERS WHERE FIVE_STAR_BUSINESS.BUSINESS_ID = AGED_USERS.BUSINESS_ID;
