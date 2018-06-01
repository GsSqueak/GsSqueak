copying
postCopy

	super postCopy.
	mutex := Mutex new.
	heap := heap copy