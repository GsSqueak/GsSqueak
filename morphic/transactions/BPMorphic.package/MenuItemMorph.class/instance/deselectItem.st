private
deselectItem
	| _gsSqueakTemp_item |
	self isSelected: false.
	subMenu
		ifNotNil: [subMenu deleteIfPopUp].
	(owner isKindOf: MenuMorph)
		ifTrue: [_gsSqueakTemp_item := owner popUpOwner.
			(_gsSqueakTemp_item isKindOf: MenuItemMorph)
				ifTrue: [_gsSqueakTemp_item deselectItem]]