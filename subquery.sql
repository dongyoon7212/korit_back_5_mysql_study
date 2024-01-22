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
# 이게 성능상 더 빠름
select
	*
from
	publisher_tb pt
    left outer join (select count(*) as total_count from publisher_tb) tb2 on(1 = 1);
    
select
	*
from
	book_tb
where
	publisher_id in (select publisher_id from publisher_tb where publisher_name like '아%'); # 이미 결정된 값과 비교만 하기 때문에 비교적 자원이 적게 소모됨
    
select
	*
from
	book_tb bt
    left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id) # 데이터가 많으면 비교하고 합치는데 많은 자원이 소모됨, 합칠때 데이터의 양만큼 시간이 걸림
where
	pt.publisher_name like '아%';

select @@profiling; # 실행 속도 보는 법, 보고 쿼리문을 선택한다.
show profiles; # 데이터 양과 조건식에 따라 다르다. 속도를 보고 선택하고 쓴다.
set profiling = 1;