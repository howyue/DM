/* Remove duplicates 80 of them */
proc sort data=dm.raw nodup out=dm.raw;
 by _all_;
run; 

data work.ds;
	set dm.raw;

/* Update ? to Unknown */
	if JobType='?' then	JobType='Unknown';
	if Job='?' then	Job='Unknown';
	if Country='?' then	Country='Unknown';

/* Rank the Qualification & Salary attributes */
	if Qualification='Preschool' then Education_Rank=1;
	else if Qualification='1st-4th' then Education_Rank=2;
	else if Qualification='5th-6th' then Education_Rank=3;
	else if Qualification='7th-8th' then Education_Rank=4;
	else if Qualification='9th' then Education_Rank=5;
	else if Qualification='10th' then Education_Rank=6;
	else if Qualification='11th' then Education_Rank=7;
	else if Qualification='12th' then Education_Rank=8;
	else if Qualification='HS-grad' then Education_Rank=9;
	else if Qualification='Prof-school' then Education_Rank=10;
	else if Qualification='Assoc-acdm' then	Education_Rank=11;
	else if Qualification='Assoc-voc' then Education_Rank=12;
	else if Qualification='Some-college' then Education_Rank=13;
	else if Qualification='Bachelors' then Education_Rank=14;
	else if Qualification='Masters' then Education_Rank=15;
	else Education_Rank=16;
	
	if salary='<=50K' then Salary_Rank=1;
	else Salary_Rank=2;

/* Combine capital_gain & capital_loss */
	if capital_gain > 0 then capital_gain_loss = capital_gain;
	else if capital_loss > 0 then capital_gain_loss = capital_loss*-1;
	else capital_gain_loss = 0;
	
run;

/* Apply Zero Score transformation against continuous attributes */
proc stdize data=work.ds method=std out=work.zs;
	var Age Years_in_Education Capital_gain_loss Work_per_week;
run;

