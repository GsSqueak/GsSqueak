accessing
bag: anObject

	self basicBag: anObject.
	self flush.
	self changed.
