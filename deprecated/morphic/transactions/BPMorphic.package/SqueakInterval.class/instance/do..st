enumerating
do: aBlock 
	"Evaluate aBlock for each value of the interval.
	Implementation note: instead of repeatedly incrementing the value
	aValue := aValue + step.
	until stop is reached,
	We prefer to recompute value from start
	aValue := start + (index * step).
	This is better for floating points accuracy, while not degrading Integer
	and Fraction speed too much.
	Moreover, this is consistent with methods #at: and #size"
	| _gsSqueakTemp_aValue _gsSqueakTemp_index _gsSqueakTemp_size |
	_gsSqueakTemp_index := 0.
	_gsSqueakTemp_size := self size.
	[_gsSqueakTemp_index < _gsSqueakTemp_size]
		whileTrue: [_gsSqueakTemp_aValue := start + (_gsSqueakTemp_index * step).
			_gsSqueakTemp_index := _gsSqueakTemp_index + 1.
			aBlock value: _gsSqueakTemp_aValue]