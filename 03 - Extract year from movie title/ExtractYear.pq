let
    source = {
		"The Shawshank Redemption (1994)",		//1994
		"My Dad Says (2010) {Dog Ed (#1.7)}",	//2010
		"Years Younger (2004/I)",				//2004
		"abcd(19xy) hqskj dhq (2020)",			//2020
		"fdsdf (1995) sdfsdf (19)"				//1995
	},
	result = List.Transform(source, each extractYear(_)),
	extractYear = (string as text) =>
let
    starts = Text.PositionOf(string, "(", Occurrence.All),
    blocks = List.Transform(
		starts, 
		each try Text.Range(string, _ + 1, 4) otherwise null
	),
    blocks1920 = List.Select(
		blocks, 
		each Text.StartsWith(_, "19") or Text.StartsWith(_, "20")
	), 
    blocks1920dd= List.Select(
		blocks1920, 
		each IsDigit(Text.Range(_,2,1)) and IsDigit(Text.Range(_,3,1))
	),    
    IsDigit = (x as text) as logical => 
		Character.ToNumber(x)>=Character.ToNumber("0") 
		and Character.ToNumber(x)<=Character.ToNumber("9"),
    value = List.Single(blocks1920dd)
in
    value 
in
    result