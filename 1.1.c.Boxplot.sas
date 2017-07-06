ods graphics / reset width=4in height=4in imagemap;
proc sgplot data=DM.RAW;
	title "Box Plot - Age";
	vbox Age / fillattrs=(color=CXCAD5E5) name='Box';
	xaxis fitpolicy=splitrotate;
	yaxis grid;
run;

proc sgplot data=DM.RAW;
	title "Box Plot - Years In Education";
	vbox Years_in_Education / fillattrs=(color=CXCAD5E5) name='Box';
	xaxis fitpolicy=splitrotate;
	yaxis grid;
run;

proc sgplot data=DM.RAW;
	title "Box Plot - Work Per Week";
	vbox Work_Per_Week / fillattrs=(color=CXCAD5E5) name='Box';
	xaxis fitpolicy=splitrotate;
	yaxis grid;
run;
ods graphics / reset;
