proc hpbin data=work.ds bucket numbin=5;
	input years_in_education;
run;

proc hpbin data=work.ds winsor winsorrate=0.05 numbin=5;
	input work_per_week;
run;

/* According to equal-depth (Bucket) method */
proc format ;
	value yiefmt low-<4="Below 4" 4-<7="Between 4 and 6" 7-<10="Between 7 and 9" 
		10-<13="Between 10 and 12" 13-high="Above 12";
run;

/* According to winsorized method */
proc format ;
	value wpwfmt low-<26="Below 26" 26-<34="Between 26 and 33" 
		34-<42="Between 34 and 41" 42-<50="Between 42 and 49" 50-high="Above 49";
run;

data work.binning;
	format years_in_education yiefmt.
		work_per_week wpwfmt.;
	set work.ds;
	keep years_in_education work_per_week;
run;

proc freq data=work.binning;
	tables years_in_education work_per_week / plots=(freqplot) nocum norow nocol;
run;
