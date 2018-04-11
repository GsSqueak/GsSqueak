private
unusedColormapEntry
	"Return the index of an unused color map entry, or zero if there isn't
	one. "
	| _gsSqueakTemp_tallies |
	_gsSqueakTemp_tallies := self tallyPixelValues.
	1
		to: _gsSqueakTemp_tallies size
		do: [:i | (_gsSqueakTemp_tallies at: i)
					= 0
				ifTrue: [^ i]].
	^ 0