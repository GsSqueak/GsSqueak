*SqClasses-*SqClasses-*SqClasses-vm
platformSourceVersion
	"Answer a string corresponding to the version of the external platform source
	code, typically written in C and managed separately for each platform. This
	invokes an optional primitive that may not be available on all virtual machines."

	"Smalltalk vm platformSourceVersion"

	
	(self getSystemAttribute: 1009) ifNotNil:
		[:platformSourceVersion| ^platformSourceVersion].
	self notify: 'This virtual machine supports neither the optional primitive #primitivePlatformSourceVersion nor the optional system attribute 1009' translated.
	^''
