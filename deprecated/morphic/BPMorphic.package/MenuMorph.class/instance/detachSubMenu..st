menu
detachSubMenu: evt 
	| _gsSqueakTemp_possibleTargets _gsSqueakTemp_item _gsSqueakTemp_subMenu _gsSqueakTemp_index |
	_gsSqueakTemp_possibleTargets := self items
				select: [:any | any hasSubMenu].
	_gsSqueakTemp_possibleTargets size > 0
		ifTrue: [_gsSqueakTemp_index := UIManager default
						chooseFrom: (_gsSqueakTemp_possibleTargets
								collect: [:t | t contents asString])
						title: 'Which menu?'.
			_gsSqueakTemp_index = 0
				ifTrue: [^ self]].
	_gsSqueakTemp_item := _gsSqueakTemp_possibleTargets at: _gsSqueakTemp_index.
	_gsSqueakTemp_subMenu := _gsSqueakTemp_item subMenu.
	_gsSqueakTemp_subMenu
		ifNotNil: [_gsSqueakTemp_item subMenu: nil.
			_gsSqueakTemp_item delete.
			_gsSqueakTemp_subMenu stayUp: true.
			_gsSqueakTemp_subMenu popUpOwner: nil.
			_gsSqueakTemp_subMenu addTitle: _gsSqueakTemp_item contents.
			evt hand attachMorph: _gsSqueakTemp_subMenu]