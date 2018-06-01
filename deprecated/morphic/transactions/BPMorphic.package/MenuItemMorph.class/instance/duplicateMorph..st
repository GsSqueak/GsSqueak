grabbing
duplicateMorph: evt 
	"Make and return a duplicate of the receiver's argument"
	| _gsSqueakTemp_dup _gsSqueakTemp_menu |
	_gsSqueakTemp_dup := self duplicate isSelected: false.
	_gsSqueakTemp_menu := MenuMorph new defaultTarget: nil.
	_gsSqueakTemp_menu addMorphFront: _gsSqueakTemp_dup.
	_gsSqueakTemp_menu bounds: self bounds.
	_gsSqueakTemp_menu stayUp: true.
	evt hand grabMorph: _gsSqueakTemp_menu from: owner.
	"duplicate was ownerless so use #grabMorph:from: here"
	^ _gsSqueakTemp_menu