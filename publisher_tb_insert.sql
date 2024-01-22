insert into publisher_tb
select
	0,
	publisher
from
	temp_book_tb
group by
	publisher
order by
	publisher;