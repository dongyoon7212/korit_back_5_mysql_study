select * from student_tb;
# 별의 의미는 전체 컬럼

# from -> where -> select 순서

select
	student_id, # 한줄씩
    name,
    age # 마지막은 쉼표 없게
from
	student_tb
where
	not name = '이동윤'
    and name = '삼동윤';
    
select
	*
from
	student_tb
where
	name in ('이동윤', '삼동윤');
    
select
	*
from
	student_tb
where
	student_id in (1, 2, 3);
    
truncate table student_tb;

/*
	10명의 학생 정보 추가
    김도균 27 부산 금정구
    김도훈 25 부산 부산진구
    김범수 33 부산 금정구
    김상현 26 부산 남구
    이재영 26 부산 서구
    이정찬 29 부산 부산진구
    이지언 26 부산 동래구
    이편원 30 경상남도 양산시
    전주환 30 부산 부산진구
    심재원 29 부산 남구
*/
insert into student_tb 
values
	(0,'김도균', 27, '부산 금정구'),
    (0,'김도훈', 25, '부산 진구'),
    (0,'김범수', 33, '부산 금정구'),
    (0,'김상현', 26, '부산 남구'),
    (0,'이재영', 26, '부산 서구'),
    (0,'이정찬', 29, '부산 부산진구'),
    (0,'이지언', 26, '부산 동래구'),
    (0,'이평원', 30, '경상남도 양산시'),
    (0,'전주환', 30, '부산 부산진구'),
    (0,'심재원', 29, '부산 남구');
    

select
	*
from
	student_tb
where
	age between 20 and 29; # between 보통 숫자나 날짜 값에 사용
    
select
	*
from
	student_tb
where
	age between 30 and 39;
    
select
	*
from
	student_tb
where
	name like '김__'; # like연산 '김%', '%김' -> 김으로 시작하거나 끝나는 것, 김__도 가능 (글자수를 맞춰야함)
    #'%특정글자%' -> 특정글자가 포함된 것, '이%원%' -> 이로 시작하고 원을 포함한 

select
	*
from
	student_tb
where
	name like '_도_' 
    or name like '__원';
    
# 집계 (그룹화)
# from -> where -> group by -> having -> select -> order by
# select에 count가 없더라도 having에 count가능
select
	name,
	address,
	count(*) as address_count # count 전체 갯수, as 이름 지정
from
	student_tb
group by
	address # 그룹화 할 대상
having
	#address_count >= 2;
    count(*) >= 2
order by # 정렬 마지막에 정렬
	address_count desc, #desc는 내림차순
    address desc;
    
