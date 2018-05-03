*EnvironmentsEnv7-class initialization
cleanUp
	self
		allInstancesDo: [:env | env purgeUndeclared]
