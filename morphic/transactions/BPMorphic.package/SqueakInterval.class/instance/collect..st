enumerating
collect: aBlock 
	| _gsSqueakTemp_nextValue _gsSqueakTemp_result |
	_gsSqueakTemp_result := self species new: self size.
	_gsSqueakTemp_nextValue := start.
	1
		to: _gsSqueakTemp_result size
		do: [:i | 
			_gsSqueakTemp_result
				at: i
				put: (aBlock value: _gsSqueakTemp_nextValue).
			_gsSqueakTemp_nextValue := _gsSqueakTemp_nextValue + step].
	^ _gsSqueakTemp_result