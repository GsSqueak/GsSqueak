printing
primitiveErrorVariableName
	"Answer the primitive error code temp name, or nil if none."
	self primitive > 0 ifTrue:
		[self pragmas do:
			[:pragma| | kwds ecIndex |
			((kwds := pragma keyword keywords) first = 'primitive:'
			and: [(ecIndex := kwds indexOf: 'error:') > 0]) ifTrue:
				[^pragma argumentAt: ecIndex]]].
	^nil