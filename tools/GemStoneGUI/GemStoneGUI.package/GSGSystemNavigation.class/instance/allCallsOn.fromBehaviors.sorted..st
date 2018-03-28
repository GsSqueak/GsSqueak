query
allCallsOn: aLiteral fromBehaviors: behaviors sorted: sorted
	"Answer a collection of all the methods implemented by behaviors that call on aLiteral even deeply embedded in literal array."
	
	
	^ self interface environment: self environment sendersOf: aLiteral env: 0