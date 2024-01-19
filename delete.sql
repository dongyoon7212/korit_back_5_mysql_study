delete
from
	product_register_tb
where
	product_color_id = (select
							product_color_id
						from
							product_color_tb
						where
							product_color_name = 'Black');
# 서브쿼리, select결과가 하나만 가능 => 여러개면 = 대신 in 안에 넣어야 한다.
# select안, insert, update 등등 다 사용가능
select
	*
from
	product_register_view;
    
#delete는 join 불가능