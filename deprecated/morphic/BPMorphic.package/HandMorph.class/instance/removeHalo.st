halo handling
removeHalo
	"remove the receiver's halo (if any)"
	| _gsSqueakTemp_halo |
	_gsSqueakTemp_halo := self halo.
	_gsSqueakTemp_halo
		ifNil: [^ self].
	_gsSqueakTemp_halo delete.
	self removeProperty: #halo