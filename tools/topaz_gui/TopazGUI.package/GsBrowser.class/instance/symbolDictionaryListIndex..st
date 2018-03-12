symbol dictionary list
symbolDictionaryListIndex: anInteger 
	"Set the selected system category index to be anInteger. Update all other 
	selections to be deselected."
	
	self selectSymbolDictionary: (self symbolDictionaryList at: anInteger ifAbsent: [nil])