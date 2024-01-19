use test_product;
select * from product_tb;
truncate table product_tb;

insert into product_tb
values
    (0, '모헤어 브이넥 앙고라 니트', 'S', 'Black', 37400),
    (0, '모헤어 브이넥 앙고라 니트', 'M', 'Black', 37400),
    (0, '모헤어 브이넥 앙고라 니트', 'L', 'Bla ck', 37400),
    (0, '모헤어 브이넥 앙고라 니트', 'XL', 'Black', 37400),
	(0, '콘테 코듀로이 와이드 밴딩 팬츠', 'S', 'White', 38000),
	(0, '콘테 코듀로이 와이드 밴딩 팬츠', 'M', 'White', 38000),
	(0, '콘테 코듀로이 와이드 밴딩 팬츠', 'L', 'White', 38000),
	(0, '콘테 코듀로이 와이드 밴딩 팬츠', 'XL', 'White', 38000),
	(0, '콘테 코듀로이 와이드 밴딩 팬츠', 'XXL', 'White', 38000),
	(0, '버티칼 투웨이 골지 양털 집업', 'M', 'Navy', 49000),
	(0, '버티칼 투웨이 골지 양털 집업', 'L', 'Navy', 49000),
	(0, '버티칼 투웨이 골지 양털 집업', 'XL', 'Navy', 49000),
	(0, '버티칼 투웨이 골지 양털 집업', 'XXL', 'Navy', 49000),
	(0, '반집업 꽈배기 카라니트', 'SS', 'White', 48000),
	(0, '반집업 꽈배기 카라니트', 'S', 'White', 48000),
	(0, '반집업 꽈배기 카라니트', 'M', 'White', 48000),
	(0, '반집업 꽈배기 카라니트', 'L', 'White', 48000),
	(0, '반집업 꽈배기 카라니트', 'XL', 'White', 48000),
	(0, '후드 MA-1 패딩 점퍼', 'S', 'Black', 62000),
	(0, '후드 MA-1 패딩 점퍼', 'M', 'Black', 62000),
	(0, '후드 MA-1 패딩 점퍼', 'L', 'Black', 62000),
	(0, '후드 MA-1 패딩 점퍼', 'XL', 'Black', 62000);
    
# 색상별 수량
select
	product_color,
	count(*) as product_color_count
from 
	product_tb
group by
	product_color;

# 사이즈별 수량
select
	product_size,
    count(*) as product_size_count
from
	product_tb
group by
	product_size;
    
    
# 제1정규화 -> 하나의 칸엔 하나의 데이터만

# 제2정규화 -> 현재 테이블의 주제와 관련없는 칼럼을 다른 테이블로 빼는 작업
# 제2정규화를 만족하는 테이블은 제2정규형
# 제2정규형이란? partial dependency를 제거한 테이블
# composite primary key란? 서로 다른 칼럼 두개를 합쳐서 primary key로 사용하는 것
# parial dependency(하나의 composite primary key에 종속)

# 제3정규화 -> 일반 칼럼에만 종속된 컬럼은 다른 테이블로 빼기
# 제3정규화를 만족하는 테이블은 제3정규형