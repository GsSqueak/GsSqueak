halo handling
removeHaloFromClick: anEvent on: aMorph 
	| _gsSqueakTemp_halo |
	_gsSqueakTemp_halo := self halo
				ifNil: [^ self].
	(_gsSqueakTemp_halo target hasOwner: self)
		ifTrue: [^ self].
	(_gsSqueakTemp_halo staysUpWhenMouseIsDownIn: aMorph)
		ifFalse: [self removeHalo]