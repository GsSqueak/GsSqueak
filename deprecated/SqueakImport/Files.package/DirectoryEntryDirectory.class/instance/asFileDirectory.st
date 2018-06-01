convert
asFileDirectory
	"Answer a FileDirectory representing the same directory I represent."

	^directory on: (directory fullNameFor: name)