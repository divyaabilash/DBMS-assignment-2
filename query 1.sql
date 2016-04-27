select * from (select business_id from business
where city='San Jose' and state='CA' and status='T') B , (select count(Review_id) as numberOfReviews,Business_id from Reviews group by Business_id order by numberOfReviews desc)R 
where B.Business_id = R.Business_id and rownum <=7;
