---SCENARIO: card# with ind_id, hh_id mappings
data:
tran: tr1,c1
card-map: 
c1,i1,h1
c2,i1,h1
c3,i2,h1

--distinct cards associated
WITH
trans as (SELECT 't1' as tr_id, 's1' as crd)
,sha_demo AS (
 SELECT 's1' as crd, 'i1' as final_individ, 'h1' as final_hholdid UNION ALL
 SELECT 's2' as crd, 'i1' as final_individ, 'h1' as final_hholdid UNION ALL
 SELECT 's3' as crd, 'i2' as final_individ, 'h1' as final_hholdid
)
,trans_demo_map AS (
 SELECT a.tr_id, a.crd, c.final_individ, c.final_hholdid
  FROM trans a
   LEFT JOIN sha_demo C ON C.crd=a.crd
)
SELECT tr_id, count(distinct C.crd) as ind_id_counts, count(distinct D.crd) AS hhold_id_counts
  FROM trans_demo_map a
   LEFT JOIN sha_demo C ON C.final_individ=a.final_individ
   LEFT JOIN sha_demo D ON D.final_hholdid=a.final_hholdid
  GROUP BY a.tr_id
;
+-------+---------------+-----------------+
| tr_id | ind_id_counts | hhold_id_counts |
+-------+---------------+-----------------+
| t1    | 2             | 3               |
+-------+---------------+-----------------+

--tran-cards mappings counts
WITH
trans as (SELECT 't1' as tr_id, 's1' as crd)
,sha_demo AS (
 SELECT 's1' as crd, 'i1' as final_individ, 'h1' as final_hholdid UNION ALL
 SELECT 's2' as crd, 'i1' as final_individ, 'h1' as final_hholdid UNION ALL
 SELECT 's3' as crd, 'i2' as final_individ, 'h1' as final_hholdid
)
,trans_demo_map AS (
 SELECT a.tr_id, a.crd, c.final_individ, c.final_hholdid
  FROM trans a
   LEFT JOIN sha_demo C ON C.crd=a.crd
)
,tran_ind_id_maps AS (
 SELECT tr_id, C.crd
  FROM trans_demo_map a
   LEFT JOIN sha_demo C ON C.final_individ=a.final_individ
) SELECT count(1) FROM tran_ind_id_maps

,tran_hh_id_maps AS (
 SELECT tr_id, D.crd
  FROM trans_demo_map a
   LEFT JOIN sha_demo D ON D.final_hholdid=a.final_hholdid
) --SELECT count(1) FROM tran_hh_id_maps
;
