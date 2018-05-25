testing
whichSelectorsStoreInto: varName 
	"Answer a collection of selectors whose methods access the argument, varName, as a named class variable. Or let super try with a named instance variable."
	| ref |
	ref := self classPool
		associationAt: varName
		ifAbsent: [ ^ super whichSelectorsStoreInto: varName ].
	^self methodDict keys select: [:aSelector | (self methodDict at: aSelector) writesRef: ref ]
