context stack (message list)
messageHelpAt: anIndex
	"Show the first n lines of the sources code of the selected message."
	
	| method source formatted lineCount |
	Preferences balloonHelpInMessageLists ifFalse: [^ nil].
	contextStack size < anIndex ifTrue: [^ nil].
	
	method := (contextStack at: anIndex) method.
	
	source := method getSource.
	formatted := (Smalltalk classNamed: #SHTextStylerST80)
		ifNil: [ source asText ]
		ifNotNil: [ :SHTextStylerST80 |
			SHTextStylerST80 new
				classOrMetaClass: method methodClass;
				styledTextFor: source asText ].
	
	lineCount := 0.
	source doWithIndex: [:char :index |
		char = Character cr ifTrue: [lineCount := lineCount + 1].
		lineCount > 10 ifTrue: [
			formatted := formatted copyFrom: 1 to: index-1.
			formatted append: ' [...]'.
			^ formatted]].

	^ formatted