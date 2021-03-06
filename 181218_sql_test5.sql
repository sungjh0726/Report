-- 5번문제) 오라클 문제
/* 'Marketing’ 부서에 속한 직원의 이름(last_name), 급여(salary), 
	부서이름(department_name)을 조회하시오. 
	단, 급여는 80번 부서의 평균보다 적게 받는 직원 정보만 출력되어야 한다. */

select *
  from Employees e inner join Departments d on d.department_id = e.department_id
  where d.department_name = 'Marketing'
        and e.salary < (
                select round(avg(ee.salary), 0) salary
                  from Employees ee
                  where ee.department_id = 80
                  group by ee.department_id
        );
        

select round(avg(ee.salary), -1) salary
   from Employees ee
   where ee.department_id = 80
   group by ee.department_id;

