loading
loadSourceFiles: anArray
	"Load all the source files in the given array."
	| loader |
	loader := HTTPLoader default.
	sourceFiles := anArray collect: [:name |
		self createRequestFor: name in: loader]