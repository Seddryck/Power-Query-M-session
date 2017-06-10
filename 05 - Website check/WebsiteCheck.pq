let
	source = {
		"www.google.com",				//Exists
		"www.google.com/nowhere.html"	//Check spelling
	},
	result = List.Transform(source, each retrieveWebsite(_)),
	retrieveWebsite = (url as text) => 
let
	source = Web.Contents(
		url
		, [ManualStatusHandling={404}]
	),
	responseCode = Value.Metadata(source)[Response.Status],
	nextStep = if responseCode=404 then "check spelling" else "exists"
in
	nextStep
in 
	result