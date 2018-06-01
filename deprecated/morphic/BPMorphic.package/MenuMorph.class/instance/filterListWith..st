keyboard control
filterListWith: char 
	| _gsSqueakTemp_matchString |
	_gsSqueakTemp_matchString := self
				valueOfProperty: #matchString
				ifAbsentPut: [String new].
	_gsSqueakTemp_matchString := char = Character backspace
				ifTrue: [_gsSqueakTemp_matchString isEmpty
						ifTrue: [_gsSqueakTemp_matchString]
						ifFalse: [_gsSqueakTemp_matchString allButLast]]
				ifFalse: [_gsSqueakTemp_matchString copyWith: char].
	self setProperty: #matchString toValue: _gsSqueakTemp_matchString