enumerating
reverseDo: aBlock 
	"Evaluate aBlock for each element of my interval, in reverse order.
	Implementation notes: see do: for an explanation on loop detail"
	| _gsSqueakTemp_aValue _gsSqueakTemp_index |
	_gsSqueakTemp_index := self size.
	[_gsSqueakTemp_index > 0]
		whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_index - 1.
			_gsSqueakTemp_aValue := start + (_gsSqueakTemp_index * step).
			aBlock value: _gsSqueakTemp_aValue]