initialize-release
initialize
	super initialize.
	methodReferences := OrderedCollection new: (maximumSubmissionCount := 30).
	self resume