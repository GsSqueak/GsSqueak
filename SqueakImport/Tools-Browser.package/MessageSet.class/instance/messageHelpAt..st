message list
messageHelpAt: anIndex
	"Show the first n lines of the sources code of the selected message."
	
	| reference source formatted lineCount |
	Preferences balloonHelpInMessageLists ifFalse: [^ nil].
	self messageList size < anIndex ifTrue: [^ nil].
	
	reference := self messageList at: anIndex.
	reference isValid ifFalse: [^ nil].
	
	source := reference compiledMethod getSource.
	formatted := (Smalltalk classNamed: #SHTextStylerST80)
		ifNil: [ source asText ]
		ifNotNil: [ :SHTextStylerST80 |
			SHTextStylerST80 new
				classOrMetaClass: reference actualClass;
				styledTextFor: source asText ].
	
	lineCount := 0.
	source doWithIndex: [:char :index |
		char = Character cr ifTrue: [lineCount := lineCount + 1].
		lineCount > 10 ifTrue: [
			formatted := formatted copyFrom: 1 to: index-1.
			formatted append: ' [...]'.
			^ formatted]].

	^ formatted