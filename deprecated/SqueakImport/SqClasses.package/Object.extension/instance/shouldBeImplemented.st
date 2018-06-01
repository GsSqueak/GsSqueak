*SqClasses-error handling
shouldBeImplemented
	"Announce that this message should be implemented"

	^ NotImplemented signal: ('{1} or a superclass should implement {2}' format: {self className. thisContext sender selector})
