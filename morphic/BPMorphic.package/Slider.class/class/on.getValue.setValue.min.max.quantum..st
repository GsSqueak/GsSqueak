instance creation
on: anObject getValue: getSel setValue: setSel min: min max: max quantum: quantum 
	"Answer a new instance of the receiver with
	the given selectors as the interface."
	| _gsSqueakTemp_instance |
	_gsSqueakTemp_instance := self new quantum: quantum;
				
				on: anObject
				getValue: getSel
				setValue: setSel.
	min isSymbol
		ifTrue: [_gsSqueakTemp_instance getMinimumValueSelector: min]
		ifFalse: [_gsSqueakTemp_instance minimumValue: min].
	max isSymbol
		ifTrue: [_gsSqueakTemp_instance getMaximumValueSelector: max]
		ifFalse: [_gsSqueakTemp_instance maximumValue: max].
	^ _gsSqueakTemp_instance