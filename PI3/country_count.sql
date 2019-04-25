select count(distinct dxcall),country,title,mode from
 (SELECT clustertable.dxcall,
  (select country from
(SELECT  country,continent,length(prefix) FROM cluster.dxcc where clustertable.dxcall like concat(dxcc.prefix, '%') order by 3 desc limit 1) as foo) as country ,
    clustertable.title,
    clustertable.mode
   FROM cluster.clustertable
      WHERE clustertable.insert_time >= (now() - '01:00:00'::interval)
     -- and clustertable.dxcall ='EA6NB'
      ) as fo
      group by country,title,mode
      order by 1 desc
      
  

