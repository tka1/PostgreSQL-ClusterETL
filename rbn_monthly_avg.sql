SELECT  avg(db),to_char(date,'YYYY-MM-DD'),band,tx_mode
  FROM cluster.rbn
  group by to_char(date,'YYYY-MM-DD'),band,tx_mode
  --order by to_char(date,'YYYY-MM-DD'),band,tx_mode