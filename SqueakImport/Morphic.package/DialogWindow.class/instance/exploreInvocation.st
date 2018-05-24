running
exploreInvocation

	| result context |
	self exclusive: false. "We want to explore."

	result := OrderedCollection new.
	context := thisContext.
	
	[context method selector = #getUserResponse]
		whileFalse: [context := context sender].
	
	[context sender] whileNotNil: [
		result add: context method.
		context := context sender].
	result add: context method.

	result explore.