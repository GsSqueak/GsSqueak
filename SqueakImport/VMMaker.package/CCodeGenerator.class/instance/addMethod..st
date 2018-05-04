utilities
addMethod: aTMethod
	"Add the given method to the code base."

	(methods includesKey:  aTMethod selector) ifTrue: [
		self error: 'Method name conflict: ', aTMethod selector.
	].
	methods at: aTMethod selector put: aTMethod.