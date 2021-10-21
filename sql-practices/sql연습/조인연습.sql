-- inner join

-- 예제1: employees 데이블과 title 테이블을 join하여 직원의 이름과 직책을 모두 출력
select a.first_name, b.title
  from employees a, titles b
 where a.emp_no = b.emp_no      -- join 조건(n-1)
   and b.to_date = '9999-01-01'; -- row 선택 조건
   
-- 예제2: employees 테이블과 titles 테이블을 join 하여 직원의 이름과 직책을 출력하되 여성 엔지니어만 출력하세요.
select a.first_name, b.title, a.gender
  from employees a, titles b
 where a.emp_no = b.emp_no      -- join 조건(n-1)
   and b.to_date = '9999-01-01' -- row 선택 조건1
   and a.gender = 'f'           -- row 선택 조건2
   and b.title = 'engineer';    -- row 선택 조건3

--
-- ANSI/ISO SQL1999 JOIN 표준 문법
--

-- 1) natural join
-- 두 테이블에 공통 컬럼이 있으면 별다른 조인 조건 없이 암묵적으로 조인이 됨
-- 쓸일 없음
	  select a.first_name, b.title
        from employees a natural join titles b
 where b.to_date = '9999-01-01'; -- row 선택 조건
 
-- 2) join ~ using
	  select a.first_name, b.title
        from employees a join titles b using (emp_no) 
 where b.to_date = '9999-01-01'; -- row 선택 조건
 
-- 3) join ~ on
	  select a.first_name, b.title
        from employees a join titles b on a.emp_no = b.emp_no 
 where b.to_date = '9999-01-01'; -- row 선택 조건

-- outer join
-- insert into dept values(null, '총무');
-- insert into dept values(null, '영업');
-- insert into dept values(null, '개발');
-- insert into dept values(null, '기획');
select * from dept;
-- insert into emp values(null, '둘리', 1);
-- insert into emp values(null, '마이콜', 2);
-- insert into emp values(null, '또치', 3);
-- insert into emp values(null, '길동', null);
select * from emp;

select a.name as '이름', b.name as '부서'
  from emp a join dept b on a.dept_no = b.no;
  
select a.name as '이름', ifnull(b.name, '없음') as '부서'
  from emp a left join dept b on a.dept_no = b.no;

select a.name as '이름', b.name as '부서'
  from emp a right join dept b on a.dept_no = b.no;
 
-- 실습문제1
-- 현재 회사 상황을 반영한 직원별 근무부서를 사번, 이름, 근무 부서로 출력해보세요.
select a.emp_no, a.first_name, c.dept_name
  from employees a, dept_emp b, departments c
 where a.emp_no = b.emp_no
   and b.dept_no = c.dept_no
   and b.to_date = '9999-01-01';

-- 실습문제2
-- 현재 회사에서 지급되고 있는 급여체계를 반영한 결과 출력하세요.
-- 사번, 이름, 연봉 형태로 출력하세요.
select a.emp_no, a.first_name, b.salary 
  from employees a, salaries b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
order by b.salary desc;

-- 예제: 현재 직책별로 평균 연봉과 인원수를 구하되 직책별로 인원이 100명 이상인 직책만 출력하세요.   
  select a.title, avg(salary), count(*)
    from titles a, salaries b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
	 and b.to_date = '9999-01-01'
group by a.title
  having count(*) >= 100
order by avg(salary) desc; 

-- 예제6: 현재 부서별로 현재 직책이 Engineer인 직원들에 대해서만 평균급여를 구하세요. 
   select d.dept_name, avg(b.salary)
     from dept_emp a, salaries b, titles c, departments d
    where a.emp_no = b.emp_no
	  and b.emp_no = c.emp_no
      and a.dept_no = d.dept_no
	  and a.to_date = '9999-01-01'
      and b.to_date = '9999-01-01'
      and c.to_date = '9999-01-01'
      and c.title = 'Engineer'
 group by d.dept_name;     


-- 예제7: 현재 직책별로 급여의 총합을 구하되 Engineer직책은 제외하세요. 
-- 단, 총합이 2,000,000,000이상인 직책만 나타내며 급여총합에 대해서 내림차순(DESC)로 정렬하세요.
  select a.title, sum(b.salary) as sum_salary
    from titles a, salaries b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
     and a.title != 'Engineer'
group by a.title
  having  sum_salary > 2000000000
order by sum_salary desc;  
   

 

 
   