select B.Business_Id,B.Business_Name,R.REVIEW_COUNT,R.AVERAGE_RATING FROM (select business_id,BUSINESS_NAME from business
where city='San Jose' and state='CA' and status='T') B , (select count(Review_id) as REVIEW_COUNT,Avg(RATING) AS AVERAGE_RATING, Business_id from Reviews group by Business_id order by REVIEW_COUNT desc)R 
where B.Business_id = R.Business_id and rownum <=7;
