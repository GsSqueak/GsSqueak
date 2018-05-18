selection
ensureSelectedButton

	self buttons ifEmpty: [^ self].
	self selectedButton ifNil: [self selectButton: self buttons first].
	self selectedButton enabled ifFalse: [self selectNextButton].