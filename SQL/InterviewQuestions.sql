/*write a SQL Query using below table, to find the sum of bouns per employee exceeding 3 lakhs in two sucessive years*/
Employee Year Bonus
E1 2022 200000
E1 2021 100000
E1 2020 500000
E1 2019 50000
E1 2018 50000
E2 2022 50000
E2 2021 50000
E2 2020 50000
E2 2019 50000
E3 2022 150000
E3 2021 150000
-- Using sum function
WITH employee_bonus AS (
    SELECT 'E1' AS employee_id, 2022 AS bonus_year, 200000 AS bonus
    UNION ALL SELECT 'E1', 2021, 100000
    UNION ALL SELECT 'E1', 2020, 500000
    UNION ALL SELECT 'E1', 2019, 50000
    UNION ALL SELECT 'E1', 2018, 50000
    UNION ALL SELECT 'E2', 2022, 50000
    UNION ALL SELECT 'E2', 2021, 50000
    UNION ALL SELECT 'E2', 2020, 50000
    UNION ALL SELECT 'E2', 2019, 50000
    UNION ALL SELECT 'E3', 2022, 150000
    UNION ALL SELECT 'E3', 2021, 150000
)

select a.employee_id,a.sum_bonus,a.bonus_year 
from (
		select employee_id,bonus,bonus_year,
		SUM(bonus) over(partition by employee_id order by bonus_year rows between 1 PRECEDING  and current row) as sum_bonus
		from employee_bonus
	 )a where sum_bonus > 300000

-- Using LAG
WITH employee_bonus AS (
    SELECT 'E1' AS employee_id, 2022 AS bonus_year, 200000 AS bonus
    UNION ALL SELECT 'E1', 2021, 100000
    UNION ALL SELECT 'E1', 2020, 500000
    UNION ALL SELECT 'E1', 2019, 50000
    UNION ALL SELECT 'E1', 2018, 50000
    UNION ALL SELECT 'E2', 2022, 50000
    UNION ALL SELECT 'E2', 2021, 50000
    UNION ALL SELECT 'E2', 2020, 50000
    UNION ALL SELECT 'E2', 2019, 50000
    UNION ALL SELECT 'E3', 2022, 150000
    UNION ALL SELECT 'E3', 2021, 150000
),
final_cte as (
	select employee_id,bonus,bonus_year, 
	LAG(bonus) over(partition by employee_id order by bonus_year) as sum_bonus,
	LAG(bonus_year)  over(partition by employee_id order by bonus_year) as year
	from employee_bonus
			 )
select 
a.employee_id,
a.bonus_year,
a.total_bonus 
from (select
		employee_id,
		bonus_year,
		(bonus + sum_bonus) as total_bonus
		from final_cte
		)a 
		where total_bonus > 300000;
		
/*Write a Query using below data, retrive the EmpID who is absent between two successive dates*/
with employee as (
select 1001 as EmpID, '01/01/2025' as Date
union all 
SELECT 1002,'01/01/2025' UNION ALL
SELECT 1003,'01/01/2025' UNION ALL
SELECT 1001,'01/02/2025' UNION ALL
SELECT 1002,'01/02/2025' UNION ALL
SELECT 1001,'01/03/2025' UNION ALL
SELECT 1001,'01/04/2025' UNION ALL
SELECT 1002,'01/04/2025'
)

select EmpID from (
	select EmpID,day(Date) as Date,LAG(day(Date),1) over(partition by EmpID order by EmpID,day(Date)) as previous_day,
	LAG(day(Date),2) over(partition by EmpID order by EmpID,day(Date)) as day_before_previous from employee
	)a
	where Date - previous_day > 1

/*Write a query to find employees whose salary increased in two successive years.*/

with employee_salary as (SELECT 'E1' AS employee_id, 2020 AS salary_year, 500000 AS salary
UNION ALL
SELECT 'E1', 2021, 550000
UNION ALL
SELECT 'E1', 2022, 600000
UNION ALL
SELECT 'E1', 2023, 580000
UNION ALL
SELECT 'E2', 2020, 400000
UNION ALL
SELECT 'E2', 2021, 420000
UNION ALL
SELECT 'E2', 2022, 410000
UNION ALL
SELECT 'E2', 2023, 450000
UNION ALL
SELECT 'E3', 2020, 700000
UNION ALL
SELECT 'E3', 2021, 700000
UNION ALL
SELECT 'E3', 2022, 750000
UNION ALL
SELECT 'E3', 2023, 800000
UNION ALL
SELECT 'E4', 2020, 300000
UNION ALL
SELECT 'E4', 2022, 350000
UNION ALL
SELECT 'E4', 2023, 400000),

salary_comparison AS (
    SELECT
        employee_id,
        salary_year,
        salary,
        LAG(salary_year, 1) OVER (
            PARTITION BY employee_id
            ORDER BY salary_year
        ) AS previous_year,
        LAG(salary_year, 2) OVER (
            PARTITION BY employee_id
            ORDER BY salary_year
        ) AS two_years_before,
        LAG(salary, 1) OVER (
            PARTITION BY employee_id
            ORDER BY salary_year
        ) AS previous_salary,
        LAG(salary, 2) OVER (
            PARTITION BY employee_id
            ORDER BY salary_year
        ) AS two_years_before_salary
    FROM employee_salary
)


SELECT
    employee_id,
    two_years_before AS first_year,
    previous_year AS second_year,
    salary_year AS third_year,
    two_years_before_salary AS first_year_salary,
    previous_salary AS second_year_salary,
    salary AS third_year_salary
FROM salary_comparison
WHERE salary_year - previous_year = 1
  AND previous_year - two_years_before = 1
  AND previous_salary > two_years_before_salary
  AND salary > previous_salary
ORDER BY employee_id, first_year;

/* write a Query to find second highest salary per department from table*/