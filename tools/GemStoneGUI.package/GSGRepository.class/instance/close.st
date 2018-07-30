interface
close

	(self isClosed not and: [self okToClose])
		ifTrue: [self terminate]