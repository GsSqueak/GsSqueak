*SqClasses-accessing
readFromString: aString
	"Create an object based on the contents of aString."

	^self readFrom: (ReadStream on: aString)
