select
	*
from
	(select
		rank() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as rank_num, # rank()순위, over()정렬, partition by 안에서 그룹을 묶는다.
		row_number() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as row_num, # row_number() 출판사 기준 안에서 순위정렬
		# row_number() 매칭 시킬때
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
		bt.publisher_id) as temp_book_register_tb
        # 서브쿼리 참조는 as 해야한다.
where
	temp_book_register_tb.row_num = 1;