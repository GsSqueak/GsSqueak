geometry testing
obtrudesBeyondContainer
	"Answer whether the receiver obtrudes beyond the bounds of its container"

	| top formerOwner |
	top := self topRendererOrSelf.
	top owner ifNil: [^ false].
	^ top owner isHandMorph
		ifTrue:
			[((formerOwner := top formerOwner) notNil and: [formerOwner isInWorld])
				ifFalse:
					[false]
				ifTrue:
					[(formerOwner boundsInWorld containsRect: top boundsInWorld) not]]
		ifFalse:
			[(top owner bounds containsRect: top bounds) not]