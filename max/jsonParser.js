

var myval=0;

if (jsarguments.length>1)
	myval = jsarguments[1];
outlets = 2;

function bang()
{
    post(this.patcher.path);
	outlet(0,"myvalue", "is", "probably", "not", Math.random());
	importing_and_exporting();
}

function msg_int(v)
{
	post("received int " + v + "\n");
	myval = v;
	outlet(1,"received int " + v + "\n");
}

function importing_and_exporting()
{
	var x = new Dict;

	x.import_json("/Users/aliceliu/Documents/git/fMRI_MAXPATCH/max/Data_COBRE.json");
	
	// use the stringify() method to get the dictionary (including nested dictionaries) in JSON format
	var xjson = x.stringify();
	
	post("JSON from stringify() method!"); 
	post();
	post(xjson); 
	post();
		
	post(" "); 
	post();
	
	
}
