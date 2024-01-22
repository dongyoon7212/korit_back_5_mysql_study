insert into user_mst_tb
values (0, 'abc', '1234');

select
	*
from
	user_mst_tb;
    
select
	*
from
	user_dtl_tb;
    
delete
from
	user_mst_tb
where
	username = 'abc';
    
# 트리거 설정 = table 설정 - > Triggers
# master table 기준
# BEFORE INSERT = insert되기전 항상 실행
# 이벤트
# AFTER INSERT = insert가 되고난 후 실행 new. / mst 프라이머리키가 생성이 된후(키값 생성후) ->dtl에서 key값을 받아야하기때문에 AFTER INSERT
# BEFORE DELETE = old.
# INSERT = AFTER
# DELETE = BEFORE
# UPDATE =  AFTER BEFORE 두가지 다 사용
# delete를 하더라도 데이터를 다 지우는 것이 아닌 old. 으로 다른곳으로 옮기는것