insert into author_tb
select
	0,
	author
from
	temp_book_tb
group by
	author
order by
	author;
    
select
	*
from
	author_tb;