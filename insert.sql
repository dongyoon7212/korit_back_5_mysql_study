use `db_study`; #데이터베이스 선택 -> use `데이터베이스 이름`;

insert into student_tb(student_id, name, age, address) values (0, '이동윤', 26, '부산시 사하구');
insert into student_tb(address, name, age, student_id) values ('부산시 사하구', '삼동윤', 26, 1); #pk는 중복 불가
insert into student_tb(name, address)values ('삼동윤', null);
insert into student_tb values (0, '이동윤', null, null); # 칼럼을 없애면 순서를 지키면 생략가능
insert into student_tb values (0, '이동윤', null, null), (0, '사동윤', null, null); # 여러개도 가능

insert into # tap넣기*
	student_tb
    (student_tb, name, age, address)
values 
	(
		0, 
        '이동윤', 
        null, 
        null
	),
	(0, '사동윤', null, null);

# pk를 두개 지정할 시 두개의 조합을 하나의 pk로 봄 = 컴포지드 프라이머리 키