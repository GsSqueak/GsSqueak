read, write, position
verbatim: aString
	"A version of nextPutAll that can be called knowing it won't call nextPut: "

	^ self nextPutAll: aString
