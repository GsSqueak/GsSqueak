other
fromHTMLString: aColorHex
	"Do not call this method directly, call Color>>#fromString: instead as it is more generic"

	| green red blue resultColor |
	red := (Integer readFrom: (aColorHex first: 2) base: 16).
	green := (Integer readFrom: (aColorHex copyFrom: 3 to: 4) base: 16).
	blue := (Integer readFrom: (aColorHex copyFrom: 5 to: 6) base: 16).
	resultColor := self r: red g: green b: blue range: 255.
	^ (aColorHex size = 8) 
		ifTrue: [resultColor alpha: ((Integer readFrom: (aColorHex last: 2) base: 16) / 255)]
		ifFalse: [resultColor]