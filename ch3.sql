-- 트랜잭션(Transaction) : 한 번에 같이 수행되어야할 일련의 명령수행의 집합

use academy;
show tables;
select * from money_tbl_02;
select * from sales_tbl_03;
select * from money_tbl_02, sales_tbl_03;

-- 트랜잭션 실습
-- money_tbl_02 테이블의 판매번호가 2016007인 제품의 수량과 금액을
-- sales_tbl_03 테이블에 합치도록 하고, meney_tbl_02 테이블에서는 해당 데이터가 제거
start transaction;
update sales_tbl_03 set price=2000, amount=4 where saleno=2016007;
delete from money_tbl_02 where saleno=2016007;
select * from money_tbl_02;
select * from sales_tbl_03;
-- 실패처리 rollback;
select * from money_tbl_02;
select * from sales_tbl_03;
-- 성공처리 commit;