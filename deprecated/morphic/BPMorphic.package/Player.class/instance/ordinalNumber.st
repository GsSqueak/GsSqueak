misc
ordinalNumber
	"Answer a number indicating the relative position of the receiver in its
	stack, if any, else 1"
	^ self stack
		ifNotNil: [:_gsSqueakTemp_aStack | _gsSqueakTemp_aStack cardIndexOf: self]