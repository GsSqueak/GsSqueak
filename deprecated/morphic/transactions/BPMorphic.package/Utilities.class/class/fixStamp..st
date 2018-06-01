identification
fixStamp: changeStamp 
	| _gsSqueakTemp_parts |
	_gsSqueakTemp_parts := changeStamp findTokens: ' '.
	(_gsSqueakTemp_parts size > 0
			and: [_gsSqueakTemp_parts last first isLetter])
		ifTrue: ["Put initials first in all time stamps..."
			^ String
				streamContents: [:s | 
					s nextPutAll: _gsSqueakTemp_parts last.
					_gsSqueakTemp_parts allButLast
						do: [:p | s space; nextPutAll: p]]].
	^ changeStamp