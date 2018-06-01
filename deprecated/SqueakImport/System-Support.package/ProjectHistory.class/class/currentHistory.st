accessing
currentHistory
	^CurrentHistory ifNil: [CurrentHistory := self new]