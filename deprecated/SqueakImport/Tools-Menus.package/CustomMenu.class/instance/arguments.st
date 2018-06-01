compatibility
arguments
	"Answer my arguments, initializing them to an empty collection if they're found to be nil."

	^ arguments ifNil: [arguments := OrderedCollection new]