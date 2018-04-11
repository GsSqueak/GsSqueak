*SqClasses-accessing method dictionary
recoverFromMDFault
	"This method handles methodDict faults to support, eg, discoverActiveClasses (qv)."
	(organization isMemberOf: Array) ifFalse: [^ self error: 'oops'].
	methodDict := organization first.
	organization := organization second.
