message list
messageList
	"List of messages creating dependencies"
	| selectedClass |
	classDeps ifNil: [^ #()].
	
	selectedClass := self classListSelection.
	^((classDeps at: self classDepsSelection ifAbsent:[#()]) 
		select:[:each| each actualClass name = selectedClass]
		thenCollect:[:mref| mref methodSymbol]) asArray sort