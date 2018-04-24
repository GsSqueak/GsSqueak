*SqClasses-*SqClasses-*SqClasses-miscellaneous
dumpException: ex

	self 
		logSqueakError: ex description 
		inContext: ex signalerContext .
