binding
lookupInPools: aString 
	"Iterate through all of the lookup pools to find a match for the specified
	name. "
	LookupPools
		ifNil: [^ nil].
	LookupPools
		do: [:pool | (pool bindingOf: aString)
				ifNotNil: [:assoc | ^ assoc value]].
	^ nil