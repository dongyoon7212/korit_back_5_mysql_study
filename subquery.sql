select
	at.num,
    at.author_name
from
	(select
		row_number() over(order by author_id desc) as num,
        author_id,
        author_name
	from 
		author_tb
	where
		author_name like '글%') at
where
	num > 10;

# 첫번째 방법
select
	*,
    (select
		count(*)
	from
		publisher_tb) as total_count
from
	publisher_tb;
    
# 두번째 방법
select
	*
from
	publisher_tb pt
    left outer join (select count(*) from publisher_tb) tb2 on(1 = 1);
    

