private
get: propertySymbol for: scope
	"For convenience. Does support access to non-class keys."
	
	| aClass |
	aClass := (scope isNil or: [scope isBehavior])
		ifTrue: [scope]
		ifFalse: [Smalltalk classNamed: scope].

	aClass ifNotNil: [^ self get: aClass -> propertySymbol].
		
	properties
		at: scope -> propertySymbol
		ifPresent: [:prop | ^ prop value].
		
	^ self getViaLink: scope -> propertySymbol