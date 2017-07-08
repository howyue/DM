ods graphics / reset width=4in height=4in imagemap;
proc corr data=work.ds plot=scatter();
var Years_in_Education Education_Rank Age work_per_week salary_Rank;
run;
ods graphics / reset;
