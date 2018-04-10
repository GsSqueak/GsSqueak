geometry testing
obtrudesBeyondContainer
	"Answer whether the receiver obtrudes beyond the bounds of its
	container "
	| top |
	top := self topRendererOrSelf.
	(top owner isNil
			or: [top owner isHandMorph])
		ifTrue: [^ false].
	^ (top owner bounds containsRect: top bounds) not