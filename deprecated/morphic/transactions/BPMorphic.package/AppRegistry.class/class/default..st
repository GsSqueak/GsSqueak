accessing
default: aClassOrNil 
	"Sets my default to aClassOrNil. 
	Answers the old default."
	| _gsSqueakTemp_oldDefault |
	_gsSqueakTemp_oldDefault := default.
	aClassOrNil
		ifNotNil: [self register: aClassOrNil].
	default := aClassOrNil.
	^ _gsSqueakTemp_oldDefault