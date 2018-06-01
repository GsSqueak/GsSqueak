platform specific
isActiveDirectoryClass
	"Ok, lets see if we support HFS Plus file names, the long ones"

	^ (self pathNameDelimiter = self primPathNameDelimiter) and: [(Smalltalk  getSystemAttribute: 1201) notNil and: [(Smalltalk getSystemAttribute: 1201) asNumber > 31]]