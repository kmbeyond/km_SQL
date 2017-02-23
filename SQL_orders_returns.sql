/*
tables:
T_ORDERS
T_ORDER_LINES
T_RETURNS

*/

#List all customer#, order#, order line, return reason
#columns: cust_id, ord_no, order_line_id, prod_id, reason
select ord.CUST_ID, ord.ORD_NO, ol.ID, ol.PROD_ID, ret.REASON
	from company.T_ORDERS ord 
		left join company.T_ORDER_LINES ol on ol.ORD_ID=ord.ID
		left join company.T_RETURNS ret on ret.ORD_ITEM_ID=ol.ID
		where 1=1
			order by ord.CUST_ID
;

#list all customers returns
#columns: cust_id, ord_no, prod_id, reason
select ord.CUST_ID, ord.ORD_NO, ol.ID, ol.PROD_ID, ret.REASON
	from company.T_ORDERS ord 
		left join company.T_ORDER_LINES ol on ol.ORD_ID=ord.ID
		left join company.T_RETURNS ret on ret.ORD_ITEM_ID=ol.ID
		where 1=1 and ret.ORD_ITEM_ID is not null
			order by ord.CUST_ID
;
#customes with counts of orders, lines, returns
#columns: cust_id, orders count, order lines count, returns count
select ord.CUST_ID, count(distinct ord.ORD_NO) as 'No of Orders', count(distinct ol.ID) as 'No of items', count(distinct ret.ID) as 'No of Returns'
	from company.T_ORDERS ord 
		left join company.T_ORDER_LINES ol on ol.ORD_ID=ord.ID
		left join company.T_RETURNS ret on ret.ORD_ITEM_ID=ol.ID
		where 1=1 
			group by ord.CUST_ID
			order by ord.CUST_ID
;

#Customers with at least 1 return
#columns: cust_id, orders count, order lines count, returns count

select ord.CUST_ID, count(distinct ord.ORD_NO) as No_of_Orders, count(distinct ol.ID) as No_of_items, count(distinct ret.ID) as No_of_Returns
	from company.T_ORDERS ord 
		left join company.T_ORDER_LINES ol on ol.ORD_ID=ord.ID
		left join company.T_RETURNS ret on ret.ORD_ITEM_ID=ol.ID
		where 1=1 
			group by ord.CUST_ID
            having count(ret.ID)>0
			order by ord.CUST_ID
;
#(OR using INNER JOIN)
select ord.CUST_ID, count(distinct ord.ORD_NO) as No_of_Orders, count(distinct ol.ID) as No_of_items, count(distinct ret.ID) as No_of_Returns
	from company.T_ORDERS ord 
		join company.T_ORDER_LINES ol on ol.ORD_ID=ord.ID
		join company.T_RETURNS ret on ret.ORD_ITEM_ID=ol.ID
		where 1=1 
			group by ord.CUST_ID
;
	

#customers who returned all items; 
#Assumptions: 
#(1)Qty on Order Line Item record defines count of products
#(2)Qty on Return record defines qty returned
select ord.CUST_ID, count(distinct ord.ORD_NO) as No_of_Orders, sum(ol.QTY) as qty_of_items, sum(ret.QTY) as No_of_Returns
	from company.T_ORDERS ord 
		left join company.T_ORDER_LINES ol on ol.ORD_ID=ord.ID
		left join company.T_RETURNS ret on ret.ORD_ITEM_ID=ol.ID
		where 1=1 
			group by ord.CUST_ID
            having sum(ol.QTY)=sum(ret.QTY)
			order by ord.CUST_ID
;

#customers who returned all items
#columns: cust_id, orders count, order lines count, returns count
#Assumption(s): 
#(1)There is no QTY on line item; If multiple quantity ordered, those many line items would be created
select ord.CUST_ID, count(distinct ord.ORD_NO) as No_of_Orders, count(distinct ol.ID) as No_of_items, count(distinct ret.ID) as No_of_Returns
	from company.T_ORDERS ord 
		left join company.T_ORDER_LINES ol on ol.ORD_ID=ord.ID
		left join company.T_RETURNS ret on ret.ORD_ITEM_ID=ol.ID
		where 1=1 
			group by ord.CUST_ID
            having count(distinct ret.ID)=count(distinct ol.ID)
			order by ord.CUST_ID
;




#Pivot Customer & Product quantity

#Original Query
select ord.CUST_ID, ol.PROD_ID, sum(ol.QTY) as QTY
	from company.T_ORDERS ord 
		left join company.T_ORDER_LINES ol on ol.ORD_ID=ord.ID
		#left join company.T_RETURNS ret on ret.ORD_ITEM_ID=ol.ID
		where 1=1
			group by ord.CUST_ID, ol.PROD_ID
			order by ord.CUST_ID
;
#Use this condition if to exclude returns [ sum(ol.QTY)-sum(coalesce(ret.QTY,0)) ]

###Static Pivot
select 
    t.CUST_ID, 
    MAX(IF(t.PROD_ID = '1', t.QTY, NULL)) AS '1',
    MAX(IF(t.PROD_ID = '2', t.QTY, NULL)) AS '2',
    MAX(IF(t.PROD_ID = '3', t.QTY, NULL)) AS '3',
    MAX(IF(t.PROD_ID = '4', t.QTY, NULL)) AS '4',
    MAX(IF(t.PROD_ID = '5', t.QTY, NULL)) AS '5'
    from (
		select ord.CUST_ID, ol.PROD_ID, sum(ol.QTY) as QTY
			from company.T_ORDERS ord 
				left join company.T_ORDER_LINES ol on ol.ORD_ID=ord.ID
				where 1=1
					group by ord.CUST_ID, ol.PROD_ID
    ) t
    group by t.CUST_ID
    ;
    

###Dynamic Pivot
use company;
SET @sql = NULL;

CREATE TEMPORARY TABLE cust_prod_orders
	select ord.CUST_ID, ol.PROD_ID, sum(ol.QTY) as QTY
		from company.T_ORDERS ord 
			left join company.T_ORDER_LINES ol on ol.ORD_ID=ord.ID
			where 1=1
				group by ord.CUST_ID, ol.PROD_ID
				order by ol.PROD_ID   
      ;
                    
SELECT
  GROUP_CONCAT(DISTINCT
    CONCAT(
      'MAX(IF(t.PROD_ID = \'',
      t.PROD_ID,
      '\', t.QTY, NULL)) AS \'',
      t.PROD_ID, '\''
    )
  ) INTO @sql
	FROM cust_prod_orders t
    ;

SET @sql = CONCAT('SELECT t.CUST_ID, ', @sql, ' from cust_prod_orders t
		group by t.CUST_ID ');
        


PREPARE stmt FROM @sql;
EXECUTE stmt;
DROP TEMPORARY TABLE cust_prod_orders;
DEALLOCATE PREPARE stmt;

#-------------------


                    