keystroke helpers
handleFiltering: evt

	| matchString |
	matchString := self valueOfProperty: #matchString ifAbsentPut: [ String new ].
	matchString := evt keyValue = 8 " Character backspace asciiValue "
		ifTrue: [
			matchString isEmpty 
				ifTrue: [ matchString ] 
				ifFalse: [ matchString allButLast ] ]
		ifFalse: [
			matchString copyWith: evt keyCharacter ].
	self setProperty: #matchString toValue: matchString.
	self displayFiltered: evt