message list
messageListIndex: anInteger 
	"Set the selected message selector to be the one indexed by anInteger. 
	Find all classes it is in."
	selectorIndex := anInteger.
	selectorIndex = 0
		ifTrue: [^ self].
	classList := self systemNavigation allImplementorsOf: self selectedMessageName.
	self markMatchingClasses.
	classListIndex := 0.
	self changed: #messageListIndex.
	"update my selection"
	self changed: #classList