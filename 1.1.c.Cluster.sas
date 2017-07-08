/* 1.2.b Transformation need to be executed first */
proc fastclus data=work.zs maxclusters=5 out=work.kmeanscluster;
	var Years_in_Education Education_Rank Age work_per_week salary_Rank;
run;

/* Display the total observation for each cluster */
proc freq data=work.kmeanscluster;
	table cluster;
run;
