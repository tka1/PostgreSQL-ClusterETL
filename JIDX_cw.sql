SELECT title, decall, dxcall, freq, band, country, id, sig_noise, datetime, insert_time, mode, de_continent, dx_continent, info, de_country, spotter_continent, skimmode
	FROM cluster.clustertable a
    WHERE a.insert_time >= to_timestamp('2017-04-08 07:00'::text, 'yyyy-mm-dd hh24:mi'::text) 
    AND a.insert_time < to_timestamp('2017-04-09 13:00'::text, 'yyyy-mm-dd hh24:mi'::text)
    AND a.mode::text ~~ 'CW%'::text
    AND (a.band::text = ANY (ARRAY['80M'::character varying::text, 
    '40M'::character varying::text, '20M'::character varying::text,
    '15M'::character varying::text, '10M'::character varying::text]))
     AND a.skimmode::bpchar = 'CQ'::bpchar 
     and title='RBN'
 
