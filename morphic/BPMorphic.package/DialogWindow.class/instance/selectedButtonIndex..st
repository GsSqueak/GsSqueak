accessing
selectedButtonIndex: anInteger 
	anInteger = 0
		ifTrue: [^ self selectedButton: nil].
	self
		selectedButton: (self buttons at: anInteger)