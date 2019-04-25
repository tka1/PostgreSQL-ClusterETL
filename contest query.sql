SELECT dxcall,
  (select country from(SELECT  country,continent,length(prefix) FROM cluster.dxcc where a.dxcall like concat(dxcc.prefix, '%') order by 3 desc limit 1)as foo)dxcc
	FROM cluster.clustertable a
    WHERE a.insert_time >= to_timestamp('2017-06-10 00:00'::text, 'yyyy-mm-dd hh24:mi'::text) 
    AND a.insert_time <= to_timestamp('2017-06-10 08:00'::text, 'yyyy-mm-dd hh24:mi'::text)
    AND a.mode::text ~~ 'RTTY%'::text
    AND (a.band::text = ANY (ARRAY['80M'::character varying::text, 
    '40M'::character varying::text, '20M'::character varying::text,
    '15M'::character varying::text, '10M'::character varying::text]))
     AND a.skimmode::bpchar = 'CQ'::bpchar 
     and title='RBN'
 
