let
	source = {1..5000},

	//Comment following code lines to see the difference between a value and a function
	records = List.Transform(source, each [x=_, y=Number.Random()]),
	
	//2nd example
	//records = List.Transform(source, each [x=_, y=generateRandom]),
	//generateRandom = Number.Random(),
	
	//3rd example
	//records = List.Transform(source, each [x=_, y=generateRandom()]),
	//generateRandom = () => Number.Random(),
	
	table = Table.ExpandRecordColumn(
		Table.FromList(records, Splitter.SplitByNothing()),
		"Column1",
		{"x", "y"})
in
    table