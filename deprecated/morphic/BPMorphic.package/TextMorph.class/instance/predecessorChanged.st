private
predecessorChanged
	| _gsSqueakTemp_newStart _gsSqueakTemp_oldStart |
	(self hasProperty: #CreatingParagraph)
		ifTrue: [^ self].
	_gsSqueakTemp_newStart := predecessor isNil
				ifTrue: [1]
				ifFalse: [predecessor lastCharacterIndex + 1].
	(self paragraph adjustedFirstCharacterIndex ~= _gsSqueakTemp_newStart
			or: [_gsSqueakTemp_newStart >= text size])
		ifTrue: [paragraph composeAllStartingAt: _gsSqueakTemp_newStart.
			self fit]
		ifFalse: ["If the offset to end of text has not changed, just slide"
			_gsSqueakTemp_oldStart := self firstCharacterIndex.
			self
				withSuccessorsDo: [:m | m adjustLineIndicesBy: _gsSqueakTemp_newStart - _gsSqueakTemp_oldStart]]