SELECT CHR(96 + CASE
                  WHEN COUNT(t.iCharCode) = 0 THEN 26
                  WHEN t.iCharCode > 26 THEN CASE t.iCharCode % 26
                                               WHEN 0 THEN 26
                                               ELSE t.iCharCode % 26
                                             END
                  ELSE t.iCharCode
                END) AS letter
  FROM (SELECT CAST(SUM(ASCII(letter) - 96) AS integer) AS iCharCode
          FROM letters) t
  GROUP BY t.iCharCode;
