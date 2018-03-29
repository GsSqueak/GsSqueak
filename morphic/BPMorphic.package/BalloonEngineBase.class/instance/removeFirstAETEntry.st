AET processing
removeFirstAETEntry
	| _gsSqueakTemp_index |
	_gsSqueakTemp_index := self aetStartGet.
	self aetUsedPut: self aetUsedGet - 1.
	[_gsSqueakTemp_index < self aetUsedGet]
		whileTrue: [aetBuffer
				at: _gsSqueakTemp_index
				put: (aetBuffer at: _gsSqueakTemp_index + 1).
			_gsSqueakTemp_index := _gsSqueakTemp_index + 1]