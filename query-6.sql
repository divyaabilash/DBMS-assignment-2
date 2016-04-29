SELECT X.BUSINESS_CAT_ID,Y.NAME AS CATEGORY_NAME,X.TOP_BUSINESS_IDS,X.TOP_BUSINESS_NAMES FROM (SELECT BUSINESS_CAT_ID,LISTAGG(BUSINESS_ID,',') WITHIN GROUP(ORDER BY BUSINESS_CAT_ID) AS TOP_BUSINESS_IDS,LISTAGG(BUSINESS_NAME,',') WITHIN GROUP(ORDER BY BUSINESS_CAT_ID) AS TOP_BUSINESS_NAMES FROM (SELECT DISTINCT BUSINESS_CAT_ID,BUSINESS_ID,BUSINESS_NAME FROM 
(SELECT A.PERCENTAGE,B.BUSINESS_ID,B.BUSINESS_CAT_ID,B.BUSINESS_NAME,ROW_NUMBER() OVER (PARTITION BY BUSINESS_CAT_ID ORDER BY PERCENTAGE DESC) as CATEGORY_RANK
 FROM 
(SELECT (AVG(RATING)/5)*100 AS PERCENTAGE,BUSINESS_ID FROM REVIEWS GROUP BY BUSINESS_ID) A,
(SELECT BUSINESS_ID,BUSINESS_CAT_ID,BUSINESS_NAME FROM BUSINESS ) B WHERE A.BUSINESS_ID = B.BUSINESS_ID ) WHERE CATEGORY_RANK <=2) GROUP BY BUSINESS_CAT_ID)X ,BUSINESS_CATEGORY Y
WHERE X.BUSINESS_CAT_ID = Y.BUSINESS_CAT_ID;
