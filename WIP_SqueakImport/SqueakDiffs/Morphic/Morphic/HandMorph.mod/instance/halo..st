halo handling
halo: newHalo
	"Set halo associated with this hand"

	| oldHalo |
	(oldHalo := self halo) == newHalo ifTrue: [ ^self ].
	oldHalo ifNotNil: [ oldHalo delete ].
	newHalo
		ifNil:[self removeProperty: #halo]
		ifNotNil:[self setProperty: #halo toValue: newHalo]