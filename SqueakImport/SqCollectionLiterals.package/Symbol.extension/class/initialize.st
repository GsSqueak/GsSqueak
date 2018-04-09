*SqCollectionLiterals-class initialization
initialize

	"Symbol initialize"

	Symbol rehash.
	Smalltalk addToShutDownList: self.
