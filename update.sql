update product_color_tb
set product_color_name = 'Green'
where
	product_color_name = 'Navy';
# 설저에서 safe 풀기!!

update product_color_tb
set product_color_name_kor = '화이트'
where
	product_color_name = 'White';
    
# 한번에 바꾸는 법
update product_color_tb
set
	product_color_name_kor = case 
		when product_color_name = 'Black' then '블랙'
		when product_color_name = 'White' then '화이트'
		when product_color_name = 'Green' then '그린'
        #when 조건 then 실행될 값
	end;
        
# case when then else end
# case if 중괄호 열고 end 중괄호 닫고
# when then은 else if같은것

# concat 문자열 합치기