object access
storeInteger: index ofObject: oop withValue: integer 
	"Note: May be called by translated primitive code."
	(self isIntegerValue: integer)
		ifTrue: [^ self
				storePointer: index
				ofObject: oop
				withValue: integer]
		ifFalse: [^ self primitiveFail]