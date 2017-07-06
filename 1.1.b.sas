title "Descriptive Statistics for Continuous Attributes";

proc means data=dm.raw n nmiss min mean max mode var std q1 median q3;
	var Age Years_in_Education Capital_gain Capital_loss Work_per_week;
run;

ods graphics / reset width=2.5in height=2.5in imagemap;
title "Distribution of Continuous Attributes";
proc univariate data=DM.RAW noprint;
	histogram Age Years_in_Education Capital_gain Capital_loss Work_per_week;
run;
ods graphics / reset;

title "Frequencies for Categorical Variables";
proc freq data=DM.RAW;
	tables JobType Qualification Marital_status Job Relationship_status 
		Race Gender country Salary / nocum;
	
run;

