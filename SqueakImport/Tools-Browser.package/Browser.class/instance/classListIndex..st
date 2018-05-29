class list
classListIndex: anInteger 
	| newClassName |
	newClassName := self classList at: anInteger ifAbsent: [ nil ].
	newClassName := newClassName ifNotNil: [newClassName withoutLeadingBlanks asSymbol].
	self selectClassNamed: newClassName.