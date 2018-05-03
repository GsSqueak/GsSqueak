*EnvironmentsEnv7-updating
addAllBindings
	declarations
		associationsDo: [:ea | self binding: ea addedTo: self]
