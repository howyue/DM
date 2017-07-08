data dm.raw;
	infile "/folders/myfolders/DM/Sample_DataSet_C.csv" dsd dlm="," firstobs=2;
	input Age JobType :$20. Qualification :$50.
	Years_in_Education Marital_status :$25.
	Job :$20. Relationship_Status  :$20. Race :$20. Gender :$10.
	Capital_gain Capital_loss Work_per_week Country :$50. Salary :$5.;
run;
