halo handling
halo: newHalo 
	"Set halo associated with this hand"
	| _gsSqueakTemp_oldHalo |
	_gsSqueakTemp_oldHalo := self halo.
	(_gsSqueakTemp_oldHalo isNil
			or: [_gsSqueakTemp_oldHalo == newHalo])
		ifFalse: [_gsSqueakTemp_oldHalo delete].
	newHalo
		ifNil: [self removeProperty: #halo]
		ifNotNil: [self setProperty: #halo toValue: newHalo]