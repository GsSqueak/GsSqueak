loading
loadProperty: aKey value: anObject

	| valueToStore |
	valueToStore := anObject.
	({self keyForName . self keyForType . self keyForCategory . self keyForSuperclass} includes: aKey)
		ifTrue: [valueToStore := anObject asSymbol].
	aKey = self keyForPools ifTrue: [valueToStore := anObject collect: [:string | string asSymbol] as: Array].
	self properties at: aKey put: valueToStore.