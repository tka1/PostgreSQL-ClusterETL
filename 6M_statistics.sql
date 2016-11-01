SELECT clustertable.decall,
    count(clustertable.dxcall) AS count,
    count(DISTINCT clustertable.dxcall) AS distinct_calls
   FROM cluster.clustertable
  WHERE clustertable.insert_time >= (now() - '01:00:00'::interval)
 --AND clustertable.insert_time <= to_timestamp('2016-05-30 14:00', 'yyyy-mm-dd hh24:mi')
   AND clustertable.mode = 'CW' 
  AND clustertable.title = 'RBN'
    AND clustertable.band ='6M'
    AND clustertable.skimmode = 'CQ'
  GROUP BY clustertable.decall
  ORDER BY (count(clustertable.dxcall)) DESC;