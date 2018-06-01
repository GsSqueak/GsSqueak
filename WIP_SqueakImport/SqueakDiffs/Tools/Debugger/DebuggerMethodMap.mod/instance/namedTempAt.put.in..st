accessing
namedTempAt: index put: aValue in: aContext
	"Assign the value of the temp at index in aContext where index is relative
	 to the array of temp names answered by tempNamesForContext:"
	self subclassResponsibility