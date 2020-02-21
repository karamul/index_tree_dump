create view leaf_blocks
as
with pattern as (select '\s+leaf: (.*) (\d+) \((-?\d+): row:(\d+)\.(\d+) avs:(\d+)\)' pattern from dual)
select text, 
       row_number() over(order by lineno) rn, 
       regexp_replace(text, pattern, '\1') hex_addr, 
       regexp_replace(text, pattern, '\2') dec_addr, 
       regexp_replace(text, pattern, '\3') leaf_number,
       regexp_replace(text, pattern, '\4') num_rows,
       regexp_replace(text, pattern, '\5') num_rows2,
       regexp_replace(text, pattern, '\6') avs
from test,
     pattern
where regexp_like(text, 'leaf:');

