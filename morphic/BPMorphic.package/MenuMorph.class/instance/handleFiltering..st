keystroke helpers
handleFiltering: evt 
	| _gsSqueakTemp_matchString |
	_gsSqueakTemp_matchString := self
				valueOfProperty: #matchString
				ifAbsentPut: [String new].
	_gsSqueakTemp_matchString := evt keyValue = 8
				ifTrue: ["Character backspace asciiValue"
					_gsSqueakTemp_matchString isEmpty
						ifTrue: [_gsSqueakTemp_matchString]
						ifFalse: [_gsSqueakTemp_matchString allButLast]]
				ifFalse: [_gsSqueakTemp_matchString copyWith: evt keyCharacter].
	self setProperty: #matchString toValue: _gsSqueakTemp_matchString.
	self displayFiltered: evt