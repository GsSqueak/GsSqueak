accessing
setSignFlag
	self signFlag
		ifFalse: [self objectAt: 1 put: self header + SmallInteger minVal]