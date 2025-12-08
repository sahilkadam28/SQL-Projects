Select * from bank_loan_data

Select COUNT(id) as Total_Loan_Applications from bank_loan_data

Select COUNT(id) as MTD_Total_Loan_Applications from bank_loan_data
where MONTH(issue_date) = 12

Select COUNT(id) as PMTD_Total_Loan_Applications from bank_loan_data
where MONTH(issue_date) = 11

Select SUM(loan_amount) as Total_Funded_Amount from bank_loan_data

Select SUM(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

Select SUM(loan_amount) as PMTD_Total_Funded_Amount from bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

Select SUM(total_payment) as Total_Amount_Received from bank_loan_data

Select SUM(total_payment) as MTD_Total_Amount_Received from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

Select SUM(total_payment) as PMTD_Total_Amount_Received from bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

Select AVG(int_rate) * 100 as Avg_Interest_Rate from bank_loan_data

Select AVG(int_rate) * 100 as MTD_Avg_Interest_Rate from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

Select AVG(int_rate) * 100 as PMTD_Avg_Interest_Rate from bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

Select AVG(dti) * 100 as Avg_DTI from bank_loan_data

Select AVG(dti) * 100 as MTD_Avg_DTI from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

Select AVG(dti) * 100 as PMTD_Avg_DTI from bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

Select
   (COUNT(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end) * 100)
   /
   COUNT(id) as Good_loan_percentage 
from bank_loan_data

Select COUNT(id) as Good_loan_application from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'current'

Select SUM(loan_amount) as Good_loan_funded_amount from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'current'

Select SUM(total_payment) as Good_loan_received_amount from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'current'

Select
   (COUNT(case when loan_status = 'charged off' then id end) * 100.0)
   /
   COUNT(id) as Bad_loan_percentage 
from bank_loan_data


Select COUNT(id) as Bad_loan_application from bank_loan_data
where loan_status = 'Charged Off'

Select SUM(loan_amount) as Bad_loan_funded_amount from bank_loan_data
where loan_status = 'Charged Off'

Select SUM(total_payment) as Bad_loan_received_amount from bank_loan_data
where loan_status = 'Charged Off'

Select
   loan_status,
   COUNT(id) as Total_Loan_Applications,
   SUM(total_payment) as Total_Amount_Received,
   SUM(loan_amount) as Total_Funded_Amount,
   AVG(int_rate * 100) as Interest_Rate,
   AVG(dti * 100) as DTI
from 
   bank_loan_data
Group By
   loan_status

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

Select
   MONTH(issue_date) as Month_Number,
   DATENAME(Month, issue_date) as Month_Name,
   COUNT(id) as Total_Loan_Applications,
   SUM(loan_amount) as Total_Funded_Amount,
   SUM(total_payment) as Total_Received_Amount
from bank_loan_data
group by MONTH(issue_date), DATENAME(month, issue_date)
order by MONTH(issue_date)

Select
   address_state as state,
   COUNT(id) as Total_Loan_Applications,
   SUM(loan_amount) as Total_Funded_Amount,
   SUM(total_payment) as Total_Received_Amount
from bank_loan_data
group by address_state
order by address_state

Select
   term,
   COUNT(id) as Total_Loan_Applications,
   SUM(loan_amount) as Total_Funded_Amount,
   SUM(total_payment) as Total_Received_Amount
from bank_loan_data
group by term
order by term

Select
   emp_length as Employee_length,
   COUNT(id) as Total_Loan_Applications,
   SUM(loan_amount) as Total_Funded_Amount,
   SUM(total_payment) as Total_Received_Amount
from bank_loan_data
group by emp_length
order by emp_length

Select
   purpose,
   COUNT(id) as Total_Loan_Applications,
   SUM(loan_amount) as Total_Funded_Amount,
   SUM(total_payment) as Total_Received_Amount
from bank_loan_data
group by purpose
order by COUNT(id) desc

Select
   home_ownership,
   COUNT(id) as Total_Loan_Applications,
   SUM(loan_amount) as Total_Funded_Amount,
   SUM(total_payment) as Total_Received_Amount
from bank_loan_data
group by home_ownership
order by COUNT(id) desc


