SELECT a.callsign AS decall,
    a.dx AS dxcall,
    a.freq,
    a.band,
    b.country,
    a.id,
    a.db AS sig_noise,
    to_char(a.date, 'yyyy-mm-dd'::text) AS date,
     a.date AS insert_time,
    a.tx_mode AS mode,
    a.de_cont AS de_continent,
    b.continent AS dx_continent,
    c.country AS de_country,
    a.mode AS skimmode
   FROM cluster.rbn a
     LEFT JOIN ( SELECT DISTINCT dxcc.prim_dxcc_prefix,
            dxcc.country,
            dxcc.continent
           FROM cluster.dxcc) b ON a.dx_pfx::text = b.prim_dxcc_prefix::text
     LEFT JOIN ( SELECT DISTINCT dxcc.prim_dxcc_prefix,
            dxcc.country,
            dxcc.continent
           FROM cluster.dxcc) c ON a.de_pfx::text = c.prim_dxcc_prefix::text
  WHERE a.date >= to_timestamp('2008-11-12 00:00'::text, 'yyyy-mm-dd hh24:mi'::text) 
  AND a.date <= to_timestamp('2017-11-14 00:00'::text, 'yyyy-mm-dd hh24:mi'::text)
   AND a.tx_mode::text ~~ 'CW%'::text
    AND (a.band::text = ANY (ARRAY['6m'::character varying::text])) AND a.mode::bpchar = 'CQ'::bpchar
  