typing support
findAgainNow
	| _gsSqueakTemp_where |
	_gsSqueakTemp_where := self text
				findString: FindText
				startingAt: self stopIndex
				caseSensitive: Preferences caseSensitiveFinds.
	_gsSqueakTemp_where = 0
		ifTrue: [self selectFrom: self stopIndex to: self stopIndex - 1]
		ifFalse: [self selectFrom: _gsSqueakTemp_where to: _gsSqueakTemp_where + FindText size - 1].
	^ true