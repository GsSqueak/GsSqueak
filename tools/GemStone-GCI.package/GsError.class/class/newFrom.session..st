instance creation
newFrom: gciErrSType session: gciSession

	^ self new
		session: gciSession;
		initializeFrom: gciErrSType;
		yourself