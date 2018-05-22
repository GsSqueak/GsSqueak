building
set: propertySymbol to: valueObject
	"For convenience."
	
	^ self atomicUpdate:
		[ : props |
		valueObject
			ifNil:
				[ props
					removeKey: propertySymbol
					ifAbsent: [ "already cleared, don't error" ] ]
			ifNotNil:
				[ props
					at: propertySymbol
					put: valueObject ] ]