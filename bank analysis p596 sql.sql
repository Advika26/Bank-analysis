
create database bank;

-- import data from csv files to create finance_1 and finance _2 tables;

-- we should change column name 'id' from alter table manually both in finance_1 and finance_2 

select * from bank.finance_2;

/* 1. year wise loan amount
2. Grade-Subgrade wise revolution balance
3. Total Payment for Verified status vs non verified status
4. state wise last credit pull_d wise loan status
5. Home Ownership vs last payment date stats. */

-- kpi1

select year(issue_D) as Year_of_issue_d, sum(loan_amnt) as Total_loan_amnt
from bank.finance_1
group by Year_of_issue_d
order by Year_of_issue_d;


-- kpi2

select
grade,sub_grade, sum(revol_bal) as total_revol_bal
from bank.finance_1 inner join bank.finance_2
on(finance_1.id = finance_2.id)
group by grade,sub_grade
order by grade,sub_grade;


-- kpi3

select verification_status,round(sum(total_pymnt),2) as total_payment
from bank.finance_1 inner join bank.finance_2
on(finance_1.id = finance_2.id)
group by verification_status;


-- kpi4

select addr_state,last_Credit_pull_D,loan_Status
from bank.finance_1 inner join bank.finance_2
on(finance_1.id = finance_2.id)
group by addr_state,last_Credit_pull_D,loan_Status
order by last_Credit_pull_D;


-- kpi5

select home_ownership,last_pymnt_d
from bank.finance_1 inner join bank.finance_2
on(finance_1.id = finance_2.id)
group by
home_ownership,last_pymnt_d
order by
home_ownership,last_pymnt_d;