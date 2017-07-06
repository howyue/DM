proc format;
	value AgeGroupFmt
		low-20='Teenage'
		21-30='Young'
		31-45='Mid_age'
		46-65='Mature'
		65-high='Old';
run;
data work.agegroup;
	format age AgeGroupFmt.;
	set dm.raw;
	keep age;
run;
proc freq data=work.agegroup;
  tables age / plots=(freqplot);
run;


