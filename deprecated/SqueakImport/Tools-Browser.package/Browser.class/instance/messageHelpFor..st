message list
messageHelpFor: aSelector 
	"Show the first n lines of the sources code of the message behind aSelector."
	
	| source formatted iconHelp |
	Preferences balloonHelpInMessageLists ifFalse: [^ nil].

	source := self selectedClassOrMetaClass sourceCodeAt: aSelector ifAbsent: [^ nil].
	source lineCount > 5 ifTrue: [
		| sourceLines |
		sourceLines := (source asString lines copyFrom: 1 to: 5) asOrderedCollection.
		sourceLines add: ' [...]'.
		source := sourceLines joinSeparatedBy: Character cr].

	
	formatted := (Smalltalk classNamed: #SHTextStylerST80)
		ifNil: [ source asText ]
		ifNotNil: [ :SHTextStylerST80 |
			SHTextStylerST80 new
				classOrMetaClass: self selectedClassOrMetaClass;
				styledTextFor: source asText ].
	iconHelp := (self messageIconHelpFor: aSelector) ifNotEmpty: [:t | 
		t , Character cr, Character cr].
	^ iconHelp asText
		append: formatted;
		yourself