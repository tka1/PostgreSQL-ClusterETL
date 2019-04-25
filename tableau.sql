SELECT title, decall, dxcall, freq, band, country, id, sig_noise, datetime, insert_time, mode, de_continent, dx_continent, info, de_country, spotter_continent, skimmode
	FROM cluster.clustertable a
    WHERE a.insert_time >= to_timestamp('2017-12-25 00:00'::text, 'yyyy-mm-dd hh24:mi'::text) 
    AND a.insert_time < to_timestamp('2018-12-27 00:00'::text, 'yyyy-mm-dd hh24:mi'::text)
    --AND a.mode::text ~~ 'CW%'::text
    AND a.skimmode::bpchar = 'CQ'::bpchar 
     and (title='RBN' or title ='OH2BBT')
 