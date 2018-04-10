menu messages
selectedSymbol
	"Return the currently selected symbol, or nil if none. Spaces, tabs and
	returns are ignored"
	| _gsSqueakTemp_aString |
	self hasCaret
		ifTrue: [^ nil].
	_gsSqueakTemp_aString := self selection string copyWithoutAll: CharacterSet separators.
	_gsSqueakTemp_aString size = 0
		ifTrue: [^ nil].
	Symbol
		hasInterned: _gsSqueakTemp_aString
		ifTrue: [:sym | ^ sym].
	^ nil