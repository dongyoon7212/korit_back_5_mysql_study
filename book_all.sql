select
	rank() over(order by sum(brt.loans_count) desc), # rank()순위, over()정렬
    brt.book_id,
    bt.book_name,
    bt.author_id,
    at.author_name,
    bt.publisher_id,
    pt.publisher_name,
    sum(brt.loans_count) as total_loans_count
from
	book_register_tb brt
    left outer join book_tb bt on(bt.book_id = brt.book_id)
    left outer join author_tb at on(at.author_id = bt.author_id)
    left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)
group by
	brt.book_id,
    bt.author_id,
    bt.publisher_id