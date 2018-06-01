selection
selectNextButton

	self selectedButton ifNil: [^ self].
	(self buttons anySatisfy: [:ea | ea enabled]) ifFalse: [^ self].
	
	self selectedButtonIndex: self selectedButtonIndex \\ self buttons size + 1.
	self selectedButton enabled ifFalse: [self selectNextButton].