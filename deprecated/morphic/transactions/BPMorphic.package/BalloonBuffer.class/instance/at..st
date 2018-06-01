accessing
at: index 
	"For simulation only"
	| _gsSqueakTemp_word |
	_gsSqueakTemp_word := self basicAt: index.
	_gsSqueakTemp_word < 1073741823
		ifTrue: [^ _gsSqueakTemp_word].
	"Avoid LargeInteger computations"
	^ _gsSqueakTemp_word >= 2147483648
		ifTrue: ["Negative?!"
			"word - 16r100000000"
			(_gsSqueakTemp_word bitInvert32 + 1) negated]
		ifFalse: [_gsSqueakTemp_word]