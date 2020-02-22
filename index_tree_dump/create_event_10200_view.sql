create or replace view event10200
as
with const as
(
    select 26 skip_lines, '(\S+)\(\):\s+(\S+) for\s+block\s+<0x(\S+) : 0x(\S+)>.* objd: 0x(\S+)$' pattern from dual 
),
parse as
(
    select regexp_replace(text, pattern, '\1') function_name, 
           regexp_replace(text, pattern, '\2') action_name, 
           regexp_replace(text, pattern, '\3') file_number, 
           regexp_replace(text, pattern, '\4') block_addr_hex, 
           regexp_replace(text, pattern, '\5') object_id_hex, 
           text
    from test,
         const
    where text not like 'env%'
    and text not like 'ktrexf%'
    and lineno >= skip_lines
)
select * 
from parse;

