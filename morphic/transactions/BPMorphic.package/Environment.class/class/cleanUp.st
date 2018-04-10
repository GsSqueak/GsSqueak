class initialization
cleanUp
	self
		allInstancesDo: [:env | env purgeUndeclared]