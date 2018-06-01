selection
selectPreviousButton

	self selectedButton ifNil: [^ self].
	(self buttons anySatisfy: [:ea | ea enabled]) ifFalse: [^ self].
	
	self selectedButtonIndex: self selectedButtonIndex - 2 \\ self buttons size + 1.
	self selectedButton enabled ifFalse: [self selectPreviousButton].