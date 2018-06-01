instance creation
on: anObject getValue: getSel setValue: setSel min: min max: max quantum: quantum
	"Answer a new instance of the receiver with
	the given selectors as the interface."

	| instance |
	instance := self new
		quantum: quantum;
		on: anObject
		getValue: getSel
		setValue: setSel.
	min isSymbol
		ifTrue: [instance getMinimumValueSelector: min]
		ifFalse: [instance minimumValue: min].
	max isSymbol
		ifTrue: [instance getMaximumValueSelector: max]
		ifFalse: [instance maximumValue: max].
	^ instance