set @count = 0;

call p_sum(10, 20, @result); 
call p_sum(20, 30, @result, @count);
# 프로시저는 call로 호출한다.
# @result 결과값이 저장된 변수명

select
	@count;
    
# Procedures -> 매개변수로 뭘 주느냐에 따라 달라짐
# = ` 안에는 p_ 로 시작`
# in = 입력, out = 출력, inout = input,output으로 사용
# PROCEDURE에는 return X , out이 출력 여러개도 가능
# BEGIN
# declare(지역변수) = _(언더바)로 시작