instance creation
server: serverString directories: aCollection 
	"answer a new instance of the receiver on server aString"
	^ self new initializeServer: serverString directories: aCollection