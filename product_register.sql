create view product_register_view as # view 생성 => 가상테이블을 하나 만든다.
select
	prt.product_register_id, # 앵간하면 as를 붙여라.
    prt.product_id,
    pt.product_name,
    pt.product_price,
    prt.product_size_id, # 중복되서 하나만 출력해야한다면 마스터를 출력한다.
    pst.product_size_name,
    prt.product_color_id,
    pct.product_color_name
from
	#얘가 마스터
	product_register_tb prt # join은 곱하기라고 생각
    # 테이블에서 as는 생략가능 as를 쓰면 코드를 줄일 수 있다.
    left outer join product_tb pt on(pt.product_id = prt.product_id)
    left outer join product_size_tb pst on(pst.product_size_id = prt.product_size_id)
    left outer join product_color_tb pct on(pct.product_color_id = prt.product_color_id); # on(조건) -> 참일때 join

    # product_color_tb의 컬러 아이디와 product_register_tb의 컬러 아이디가 같을때 join을 해라
	# 붙일지 말지는 슬레이브 테이블이 결정한다. 예를들어 on(product_color_tb.product_color_id = product_register_tb.product_color_id)여기서는 color가 결정하게 된다.
    # 따라서 비교되는 대상이 앞에 와야하므로 color가 앞에 오고 비교한다. 고정값인 register는 뒤에, register는 가만히 있는 거임.
    # 쉽게 생각해서 left outer join 뒤에 나오는 것은 무조건 on에서 앞으로 적는다.
    
# 색상별 갯수
select
    prt.product_color_id,
    pct.product_color_name,
    count(pct.product_color_id) as product_color_count
from
	product_register_tb prt
    left outer join product_tb pt on(pt.product_id = prt.product_id)
    left outer join product_size_tb pst on(pst.product_size_id = prt.product_size_id)
    left outer join product_color_tb pct on(pct.product_color_id = prt.product_color_id)

group by
	pct.product_color_id,
    pct.product_color_name;
    
# 사이즈별 갯수
select
    prt.product_size_id,
    pst.product_size_name,
    count(prt.product_size_id) as product_size_count
from
	product_register_tb prt
    left outer join product_tb pt on(pt.product_id = prt.product_id)
    left outer join product_size_tb pst on(pst.product_size_id = prt.product_size_id)
    left outer join product_color_tb pct on(pct.product_color_id = prt.product_color_id)

group by
	prt.product_size_id,
    pst.product_size_name
order by
	prt.product_size_id;
    

# view 사용
select
	product_size_id,
    product_size_name,
    count(product_size_id) as product_size_count
from
	product_register_view
group by
	product_size_id,
    product_size_name;
    
select
	*
from
	product_register_view
where # where이 group by가 먼저 온다.
	product_size_id >= 4
# group by
# 	product_size_id;

	