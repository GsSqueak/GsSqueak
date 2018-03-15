typing/selecting keys
querySymbol: aKeyboardEvent 
	"Invoked by Ctrl-q to query the Symbol table and display alternate
	symbols. "
	| _gsSqueakTemp_hintText _gsSqueakTemp_lastOffering _gsSqueakTemp_offering |
	(self isTypingIn not
			or: [self history current type ~= #query])
		ifTrue: [self closeTypeIn.
			self openTypeIn.
			self selectPrecedingIdentifier.
			self closeTypeIn].
	self openTypeInFor: #query.
	_gsSqueakTemp_hintText := self history current contentsBefore string.
	_gsSqueakTemp_hintText := _gsSqueakTemp_hintText copyFrom: (_gsSqueakTemp_hintText lastIndexOfAnyOf: Character separators , '#' startingAt: _gsSqueakTemp_hintText size)
					+ 1 to: _gsSqueakTemp_hintText size.
	self selectInvisiblyFrom: self history current intervalBefore first to: self stopIndex - 1.
	_gsSqueakTemp_lastOffering := self selection string.
	_gsSqueakTemp_lastOffering := (_gsSqueakTemp_lastOffering copyReplaceAll: ':  ' with: ':') withBlanksTrimmed.
	"Only offer suggestions for not-empty tokens."
	_gsSqueakTemp_hintText
		ifEmpty: [morph flash.
			self closeTypeIn.
			^ true].
	_gsSqueakTemp_offering := Symbol thatStarts: _gsSqueakTemp_hintText skipping: _gsSqueakTemp_lastOffering.
	_gsSqueakTemp_offering
		ifNil: [_gsSqueakTemp_offering := Symbol thatStarts: _gsSqueakTemp_hintText skipping: nil].
	_gsSqueakTemp_offering
		ifNil: [morph flash.
			self closeTypeIn.
			^ true].
	"Add some nice spacing to the suggestion."
	_gsSqueakTemp_offering := _gsSqueakTemp_offering copyReplaceAll: ':' with: ':  '.
	_gsSqueakTemp_offering last = Character space
		ifTrue: [_gsSqueakTemp_offering := _gsSqueakTemp_offering allButLast].
	"Insert the suggestions. (Note that due to previous selection, things
	will be overwritten and not appended.)"
	self typeAhead nextPutAll: _gsSqueakTemp_offering.
	^ false