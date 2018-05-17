private
get: keyObject 
	"keyObject is intended to be an Association. We have two lookup strategies: 1) along the superclass chain *of the client*, 2) via a linked theme. Evaluate the result because there can be message sends stored or blocks."
	
	| k |
	properties
		at: keyObject
		ifPresent: [:prop | ^ prop value].
	
	keyObject isVariableBinding "simple key objects"
		ifFalse: [^ self getViaLink: keyObject].
	
	k := keyObject key.
	(self getViaSuperclasses: keyObject)
		ifNotNil: [:prop | ^ prop].
		
	keyObject key: k. "restore"
	^ self getViaLink: keyObject