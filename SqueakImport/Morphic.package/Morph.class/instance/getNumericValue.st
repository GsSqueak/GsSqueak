e-toy support
getNumericValue
	"Only certain kinds of morphs know how to deal with this frontally; here we provide support for a numeric property of any morph"

	^ self valueOfProperty: #numericValue ifAbsent: [0]