set @book_name = '송사무장의 실전경매';
set @author_name = '송희창';
set @publisher_name = '지혜로';
set @new_book_id = 0;

call p_insert_book(@book_name, @author_name, @publisher_name, @new_book_id);

select
	*
from
	book_tb
order by
	book_id desc;