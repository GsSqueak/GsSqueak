menu
makeClosable
	mustNotClose := false.
	closeBox
		ifNil: [self addCloseBox]