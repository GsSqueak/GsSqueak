collection ops
add: aCharacter 
	"I automatically become a WideCharacterSet if you add a wide
	character to myself"
	| _gsSqueakTemp_index |
	(_gsSqueakTemp_index := aCharacter asInteger + 1) <= 256
		ifFalse: [| wide |
			wide := WideCharacterSet new.
			wide addAll: self.
			wide add: aCharacter.
			self becomeForward: wide.
			^ aCharacter].
	(map at: _gsSqueakTemp_index)
			= 1
		ifFalse: [map at: _gsSqueakTemp_index put: 1.
			tally := tally + 1].
	^ aCharacter