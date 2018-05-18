read, write, position
readOnlyCopy
	self flush.	"Some linux open a truncated readOnlyCopy. Force it to take latest bytes written into account."
	^ self class readOnlyFileNamed: self name.
