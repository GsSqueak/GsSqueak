accessing
ensureEndsWith: anObject
	"Append anObject to the receiver IFF there is not one on the end."

	self peekLast = anObject ifFalse:
		[self nextPut: anObject]