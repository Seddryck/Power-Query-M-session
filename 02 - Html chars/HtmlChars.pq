let
	source = ConvertHtmlSpecialChars("C&#233;dric"),
    ConvertHtmlSpecialChars = (string as text) =>
let
    start = Text.PositionOf(string, "&"),
    end = Text.PositionOf(string, ";"),
    value = Text.Range(string, start, end-start+1),
    cleanValue = 
		if Text.StartsWith(value, "&#") 
		then 
			Text.Start(
				Text.End(value, Text.Length(value)-2)
				,Text.Length(value)-3
			) 
		else null,
    replace = Character.FromNumber(Number.FromText(cleanValue)),
    replaced = Text.Replace(string, value, replace)
in
    replaced 
in
    source

//**************************************************
//2nd version supports strings with multiple/no chars to replace
//**************************************************

// let
// 	source = {"C&#233;dric", "H&#233;l&#232;ne", "Alice", "Cl&#233;mence"},
// 	transformed = List.Transform(source, each ConvertHtmlSpecialChars(_)), 
//     ConvertHtmlSpecialChars = (string as text) =>
// let
//     start = Text.PositionOf(string, "&"),
//     end = Text.PositionOf(string, ";"),
//     value = Text.Range(string, start, end-start+1),
//     cleanValue = if Text.StartsWith(value, "&#") then Text.Start(Text.End(value, Text.Length(value)-2),Text.Length(value)-3) else null,
//     replace = Character.FromNumber(Number.FromText(cleanValue)),
//     replaced = Text.Replace(string, value, replace),
// 
//     newString = try replaced otherwise string,
//     continue = 
// 		if 
// 			string=newString
// 		then 
// 			newString 
// 		else 
// 			@ConvertHtmlSpecialChars(newString)
// in
//     continue 
// in
//     transformed
