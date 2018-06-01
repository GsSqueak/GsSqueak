grabbing
aboutToBeGrabbedBy: aHand 
	"Don't allow the receiver to act outside a Menu"
	| _gsSqueakTemp_menu _gsSqueakTemp_box |
	(owner notNil
			and: [owner submorphs size = 1])
		ifTrue: ["I am a lonely menuitem already; just grab my owner"
			owner stayUp: true.
			^ owner aboutToBeGrabbedBy: aHand].
	_gsSqueakTemp_box := self bounds.
	_gsSqueakTemp_menu := MenuMorph new defaultTarget: nil.
	_gsSqueakTemp_menu addMorphFront: self.
	_gsSqueakTemp_menu bounds: _gsSqueakTemp_box.
	_gsSqueakTemp_menu stayUp: true.
	self isSelected: false.
	^ _gsSqueakTemp_menu