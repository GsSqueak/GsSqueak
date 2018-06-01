accessing
at: offset put: val

	ptrOffset = 0 ifFalse: [self error: 'only expect base address to receive at:put: message'].
	unitSize = 1 ifTrue: [^ interpreter byteAt: arrayBaseAddress + offset put: val].
	unitSize = 4 ifTrue: [^ interpreter long32At: arrayBaseAddress + (offset * 4) put: val].
	self halt: 'Can''t handle unitSize ', unitSize printString
