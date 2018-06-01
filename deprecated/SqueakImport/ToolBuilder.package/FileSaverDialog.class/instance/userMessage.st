ui details
userMessage
	"return the string to present to the user  in order to explain the purpose of this dialog appearing"
	
	^message ifNil:['Choose a file name; you can also edit the name below to create a new file name']