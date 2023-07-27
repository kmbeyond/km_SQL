
--sample data
id , seq
100, 1
100, 3
300, 2

--Result:
100, 3
300, 2


--using max() over(partition by)
with 
data as (SELECT 100 as id, 1 as seq union all select 100 as id, 3 as seq UNION ALL SELECT 300, 2)
,get_max AS (SELECT id, seq, max(seq) over(partition by id) as max_seq from data)
select * from get_max where seq=max_seq;

--using row_number()
with 
data as (SELECT 100 as id, 1 as seq union all select 100 as id, 3 as seq UNION ALL SELECT 300, 2)
,get_max AS (SELECT id, seq, row_number() over(partition by id order by seq desc) as rn from data)
select * from get_max where rn=1;

