initialization
initFor: className revertable: isRevertable

	inForce := isRevertable.
	changeTypes := IdentitySet new.
	methodChanges := IdentityDictionary new.
	priorName := thisName := className.
	revertable := isRevertable and: [self realClass notNil].
	revertable ifTrue:
		[priorMD := self realClass methodDict copy.
		priorOrganization := self realClass organization deepCopy].
