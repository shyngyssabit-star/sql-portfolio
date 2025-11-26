select department_id,job_id,max(salary),min(salary ) from hr.EMPLOYEES group by department_id,job_id having avg(salary)>10000;

select job_id,avg(salary) from hr.EMPLOYEES group by (job_id);

select TO_CHAR(hire_date, 'DAY'),count (*) from hr.EMPLOYEES GROUP BY TO_CHAR(hire_date, 'DAY')

select SUBSTR(FIRST_NAME, 1,1), count(*) from hr.EMPLOYEES group by (SUBSTR(FIRST_NAME, 1,1)) HAVING COUNT(*) > 1 order by count(*);

select DEPARTMENT_ID,min(salary),max(salary),min(hire_date),max(hire_date),count(*) from hr.EMPLOYEES group by DEPARTMENT_ID order by count(*) desc;

select manager_id,count(*) from hr.EMPLOYEES where COMMISSION_PCT is Null group by manager_id having avg(salary) between 6000 and 9000;

select salary,salary*3.1415,Round(3.1415),Trunc(salary*3.1415, -3)/1000 from hr.EMPLOYEES;

select hire_date, Add_months(hire_date, 6),last_day(hire_date) from hr.employees;

SELECT r.region_name, count(*)
from hr.employees e
Join hr.departments d ON e.department_id = d.department_id
Join hr.locations l ON d.location_id = l.location_id
Join hr.countries c ON l.country_id = c.country_id
Join hr.regions r ON c.region_id = r.region_id
group by r.region_name;

select
    r.region_name,
    count(*) as emp_count,
    sum(count(*)) over () as total_employees,
    round(count(*) / sum(count(*)) over (), 4) as pct_of_total,
    rank() over (order by count(*) desc) as region_rank,
    sum(count(*)) over (order by count(*) desc) as cumulative_employees

from hr.employees e
Join hr.departments d on e.department_id = d.department_id
Join hr.locations l on d.location_id = l.location_id
Join hr.countries c on l.country_id = c.country_id
Join hr.regions r on c.region_id = r.region_id
group by r.region_name
order by emp_count desc;
