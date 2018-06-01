accessing
limit: anObject

	self basicLimit: anObject.
	self flush.
	self changed