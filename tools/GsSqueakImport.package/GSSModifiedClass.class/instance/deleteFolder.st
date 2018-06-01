utility
deleteFolder

	self fileDirectory exists ifTrue: [self fileDirectory recursiveDelete]