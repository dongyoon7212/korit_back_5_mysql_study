set @count = 0;

call p_sum(10, 20, @result); 
call p_sum(20, 30, @result, @count);
# 프로시저는 call로 호출한다.
# @result 결과값이 저장된 변수명

select
	@count;