-- money_tbl_02에서 거래금액이 1500 이상인 레코드(튜플)를 대상으로 회원번호, 판매번호, 단가, 수량, 금액 컬럼만을 검색하여 그 결과를 뷰(money_view)로 생성하라
create view money_view as select custno, saleno, pcost, amount, price from money_tbl_02;
select * from money_view;
-- inner join 기능을 활용하여 회원번호별 회원번호, 회원명, 주소, 합계금액을 검색하시오.
select m.custno, m.custname, m.address, sum(s.price) from member_tbl_02 m inner join sales_tbl_03 s on m.custno=s.custno group by m.custno;
-- 서브쿼리를 활용하여 주소가 서울인 회원의 회원번호, 단가, 수량, 금액을 검색하시오.
select custno, pcost, amount, price from sales_tbl_03 where custno in (select custno from member_tbl_02 where address like '서울%');
-- 서브쿼리를 활용하여 주소가 서울이 아닌 회원의 회원번호, 단가, 수량, 금액을 검색하시오.
select custno, pcost, amount, price from sales_tbl_03 where custno not in (select custno from member_tbl_02 where address like '서울%');
-- sales_tbl_03과 money_tbl_02에 합집합 연산을 구현하여 sale_view뷰를 생성하시오.
use academy;
create view sale_view as select * from sales_tbl_03 union select * from money_tbl_02;
select * from sale_view;
-- sales_tbl_03과 money_tbl_02에 교집합 연산을 구현하여 sale_cross_view뷰를 생성하시오.
-- (단, sales_tbl_03의 custno, saleno를 money_tbl_02의 price의 컬럼만 추출)
create view sale_cross_view as SELECT a.custno, a.saleno, b.price FROM sales_tbl_03 a INNER JOIN money_tbl_02 b ON a.saleno = b.saleno and a.custno = b.custno;
select * from sale_cross_view;