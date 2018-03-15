keyboard control
moveSelectionDown: direction event: evt 
	"Move the current selection up or down by one, presumably under
	keyboard control.
	direction = +/-1"
	| _gsSqueakTemp_index |
	_gsSqueakTemp_index := (submorphs
				indexOf: selectedItem
				ifAbsent: [1 - direction])
				+ direction.
	submorphs
		do: [:unused | 
			| m |
			"Ensure finite"
			m := submorphs atWrap: _gsSqueakTemp_index.
			((m isKindOf: MenuItemMorph)
					and: [m isEnabled])
				ifTrue: [^ self selectItem: m event: evt].
			"Keep looking for an enabled item"
			_gsSqueakTemp_index := _gsSqueakTemp_index + direction sign].
	^ self selectItem: nil event: evt