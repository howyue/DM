proc freq data=work.ds;
	format country $CountryFmt.;
	table country;
run;

proc freq data=work.ds;
	format Education_Rank EducationFmt.;
	table Education_Rank;
run;

proc tabulate data=ds;
	format Age AgeGroupFmt.
	 jobtype $JobTypeFmt.;
	class jobtype Age;
	table jobtype * ROWPCTN,
	Age ;
run; 

proc tabulate data=ds;
	class salary gender;
	table salary * ROWPCTN,
	gender ;
run; 

proc tabulate data=ds;
	format jobtype $JobTypeFmt.;
	class jobtype salary;
	table jobtype * ROWPCTN,
	salary ;
run; 

proc freq data=ds;
	where work_per_week > 40 and years_in_education > 13;
	table salary ;
run; 
