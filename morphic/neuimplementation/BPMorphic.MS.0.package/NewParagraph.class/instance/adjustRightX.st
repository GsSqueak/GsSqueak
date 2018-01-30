private
adjustRightX
	| _gsSqueakTemp_shrink |
	_gsSqueakTemp_shrink := container right - maxRightX.
	lines
		do: [:line | line paddingWidth: line paddingWidth - _gsSqueakTemp_shrink].
	container := container withRight: maxRightX + self caretWidth