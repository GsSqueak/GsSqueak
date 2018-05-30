initialize-release
beIsolationSetFor: aProject

	self isEmpty ifFalse: [self error: 'Must be empty at the start.'].
	isolatedProject := aProject.
	revertable := true.