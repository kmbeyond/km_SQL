#------show the percentage of price change from previous time
#sample data
part_id|unit_price|part_update_timestamp
111|5.99|2022-12-01 07:35:56
111|6.99|2022-12-05 08:12:34
222|25.99|2022-12-02 08:02:45
222|29.89|2022-12-12 08:58:31
333|9.99|2022-12-15 04:38:44

Output:
+-------+----------+---------------------+-------------------+--------------------+
|part_id|unit_price|part_update_timestamp|unit_price_previous|price_change_percent|
+-------+----------+---------------------+-------------------+--------------------+
|    111|      5.99|  2022-12-01 07:35:56|                  0|                null|
|    111|      6.99|  2022-12-05 08:12:34|               5.99|               16.69|
|    222|     25.99|  2022-12-02 08:02:45|                  0|                null|
|    222|     29.89|  2022-12-12 08:58:31|              25.99|               15.01|
|    333|      9.99|  2022-12-15 04:38:44|                  0|                null|
+-------+----------+---------------------+-------------------+--------------------+

SOL:
WITH
parts_dim AS (
 SELECT 111 as part_id, 5.99 as unit_price, '2022-12-01 07:35:56' as part_update_timestamp UNION ALL
 SELECT 111 as part_id, 6.99 as unit_price, '2022-12-05 08:12:34' as part_update_timestamp UNION ALL
 SELECT 222 as part_id, 25.99 as unit_price, '2022-12-02 08:02:45' as part_update_timestamp UNION ALL
 SELECT 222 as part_id, 29.89 as unit_price, '2022-12-12 08:58:31' as part_update_timestamp UNION ALL
 SELECT 333 as part_id, 9.99, '2022-12-15 04:38:44'
)
,price_change AS (
 SELECT part_id, unit_price, part_update_timestamp, LAG(unit_price,1, unit_price) OVER ( PARTITION BY part_id ORDER BY part_update_timestamp) as unit_price_previous
  FROM parts_dim
)
SELECT part_id, unit_price, part_update_timestamp, unit_price_previous, round(((unit_price-unit_price_previous)/unit_price_previous)*100, 2) as price_change_percent
 FROM price_change
   ORDER BY part_id, part_update_timestamp
;
