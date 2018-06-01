instance creation
newOnEnvironment: anEnvironment

	^ (self newOnRepository: anEnvironment repository)
		selectEnvironment: anEnvironment;
		yourself