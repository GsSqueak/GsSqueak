utilities
enter: aString
	"Enter the project with the given name"
	^ ((self named: aString) ifNil: [^ CurrentProject]) enter