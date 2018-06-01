instance creation
server: serverString directory: directoryString 
	"answer a new instance of the receiver on server aString"
	^ self new
		initializeServer: serverString
		directories: (directoryString findTokens: '/')