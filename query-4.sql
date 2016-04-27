select DISTINCT * From (select count(A.Author),R.Business_ID from (select count(Review_id) as WrittenReviews,Author from Reviews
group by Author 
Order by count(Review_id)) A, Reviews R
where A.Author = R.Author
Group by R.Business_ID having count(R.Business_ID) >5)Result,Business B
where Result.Business_Id = B.Business_Id AND ROWNUM <=5;
