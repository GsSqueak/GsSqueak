instance creation
fullPath: fullNameString
	"answer an instance of the receiver on fullName"
	| pathParts |
	pathParts := self pathParts: fullNameString.
	^ self server: pathParts first directories: pathParts allButFirst