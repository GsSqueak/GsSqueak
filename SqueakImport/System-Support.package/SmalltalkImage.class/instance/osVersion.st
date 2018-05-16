os
osVersion
	"Return the version number string of the platform we're running on"
	
	"Smalltalk osVersion"

	^(self getSystemAttribute: 1002) asString