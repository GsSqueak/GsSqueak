accessing
value: newValue 
	| _gsSqueakTemp_t |
	_gsSqueakTemp_t := self trimmedValue: newValue.
	_gsSqueakTemp_t = value
		ifTrue: [^ self].
	value := _gsSqueakTemp_t.
	self computeSlider