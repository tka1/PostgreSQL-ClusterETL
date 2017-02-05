SELECT  count(distinct callsign) de_call_count,count(*)as spot_count,avg(db),to_char(date,'YYYY-MM-DD') as date,band,tx_mode
  FROM cluster.rbn
  group by to_char(date,'YYYY-MM-DD'),band,tx_mode,callsign
  --order by to_char(date,'YYYY-MM-DD'),band,tx_mode