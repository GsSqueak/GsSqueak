typing/selecting keys
querySymbol: aKeyboardEvent
	"Invoked by Ctrl-q to query the Symbol table and display alternate symbols."

	| hintText lastOffering offering |
	(self isTypingIn not or: [self history current type ~= #query])
		ifTrue: [
			self closeTypeIn.
			self openTypeIn.
			self selectPrecedingIdentifier.
			self closeTypeIn].
	
	self openTypeInFor: #query.
	
	hintText := self history current contentsBefore string.
	hintText := hintText copyFrom: (hintText
		lastIndexOfAnyOf: Character separators, '#'
		startingAt: hintText size) + 1 to: hintText size.
	self selectInvisiblyFrom: self history current intervalBefore first to: self stopIndex-1.
	lastOffering := self selection string.
	lastOffering := (lastOffering copyReplaceAll: ':  ' with: ':') withBlanksTrimmed.

	"Only offer suggestions for not-empty tokens."
	hintText ifEmpty: [morph flash. self closeTypeIn. ^ true].
	offering := Symbol thatStarts: hintText skipping: lastOffering.
	offering ifNil: [offering := Symbol thatStarts: hintText skipping: nil].
	offering ifNil: [morph flash. self closeTypeIn. ^ true].
	
	"Add some nice spacing to the suggestion."
	offering := offering copyReplaceAll: ':' with: ':  '.
	offering last = Character space ifTrue: [offering := offering allButLast].
	
	"Insert the suggestions. (Note that due to previous selection, things will be overwritten and not appended.)"
	self typeAhead nextPutAll: offering.

	^ false