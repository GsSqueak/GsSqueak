snapshot and quit
getFileNameFromUser
	"Ask the user for a new image name"
	^self getFileNameFromUserSuggesting: (FileDirectory localNameFor: self imageName)
