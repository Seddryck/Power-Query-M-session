let
	// !!!!
	//To successfully run this script, the project file has been edited with tag AllowNativeQuery sets to true
	// !!!!

	source = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("i45WCk7MVXAsK0rMS09V0lEyNlCK1YlWcspPUvBJLciHCJoYgQW98jPyFFzyQSJmJmCRkPxcBSAGKTFUio0FAA==", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type text) meta [Serialized.Text = true]) in type table [FullName = _t, Age = _t]),
    typedSource = Table.TransformColumnTypes(source,{{"FullName", type text}, {"Age", Int64.Type}}),

    updateStep = Table.AddColumn(
            typedSource 
            , "update"
            , each updateCustomer(_[FullName], _[Age])
            ),
    updateResult = Table.ExpandTableColumn(updateStep , "update", {"Records Affected"}, {"Updated performed"}),
    
	filteredResult = Table.SelectRows(updateResult, each ([Updated performed] = 0)),
    insertStep = Table.AddColumn(
            filteredResult
            , "insert"
            , each insertCustomer(_[FullName], _[Age])
            ),
	finalResult = Table.ExpandTableColumn(insertStep , "insert", {"Records Affected"}, {"Insert performed"}),
    
	//Low level functions
	updateCustomer = (FullName as text, Age as number) => 
		 Sql.Database(
			".\sql2014", 
			"Demo.PowerBI", 
			[Query="exec UpdateCustomer '" 	 
				& FullName 
				& "', "
				& Number.ToText(Age) 
			]),
	insertCustomer = (FullName as text, Age as number) => 
		Sql.Database(
			".\sql2014", 
			"Demo.PowerBI", 
			[Query="exec InsertCustomer '" 
				& FullName 
				& "', " 
				& Number.ToText(Age) 
			])
in
	finalResult

