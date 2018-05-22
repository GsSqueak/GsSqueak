building
set: propertySymbol for: aClassOrSymbol to: valueObject
	"Where aClass asks its userInterfaceTheme for propertySymbol, provide valueObject."
	
	| aClass |
	aClass := aClassOrSymbol isBehavior ifTrue: [aClassOrSymbol] ifFalse: [Smalltalk classNamed: aClassOrSymbol].
	aClass ifNil: [^ self].
	^ self atomicUpdate:
		[ : props | | key |
		key := aClass -> propertySymbol.
		valueObject
			ifNil:
				[ props
					removeKey: key
					ifAbsent: [ "already cleared, don't error" ] ]
			ifNotNil:
				[ props
					at: key
					put: valueObject ] ]