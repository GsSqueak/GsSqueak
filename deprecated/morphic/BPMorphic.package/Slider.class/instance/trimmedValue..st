support
trimmedValue: aValue 
	| _gsSqueakTemp_trimmedValue |
	_gsSqueakTemp_trimmedValue := aValue min: self maximumValue max: self minimumValue.
	self quantum
		ifNotNil: [:q | _gsSqueakTemp_trimmedValue := _gsSqueakTemp_trimmedValue roundTo: q].
	^ _gsSqueakTemp_trimmedValue