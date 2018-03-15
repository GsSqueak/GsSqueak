typing/selecting keys
forwardDelete: aKeyboardEvent 
	"Delete forward over the next character.
	Make Undo work on the whole type-in, not just the one char.
	wod 11/3/1998: If there was a selection use #zapSelectionWith:
	rather than #backspace: which was 'one off' in deleting the selection.
	Handling of things like undo or typeIn area were not fully considered."
	| _gsSqueakTemp_startIndex _gsSqueakTemp_stopIndex |
	morph readOnly
		ifTrue: [^ self].
	self hasSelection
		ifTrue: ["Create checkpoint in history."
			self replaceSelectionWith: self nullText.
			^ true].
	_gsSqueakTemp_startIndex := self markIndex.
	_gsSqueakTemp_startIndex > self text size
		ifTrue: [^ false].
	_gsSqueakTemp_stopIndex := _gsSqueakTemp_startIndex.
	"Forward delete next word"
	self flag: #consistency.
	"mt: We might want to implemented it like #backspace: and
	#backWord:. "
	aKeyboardEvent shiftPressed
		ifTrue: [_gsSqueakTemp_stopIndex := (self firstWordBoundaryAfter: _gsSqueakTemp_stopIndex)
						- 1].
	self selectInvisiblyFrom: _gsSqueakTemp_startIndex to: _gsSqueakTemp_stopIndex.
	self isTypingIn
		ifTrue: [self history current type = #forwardDelete
				ifTrue: ["Append next characters that will be removed."
					self history current contentsBefore append: self selection.
					self history current intervalBefore
						in: [:i | self history current
								intervalBefore: (i first to: i last + (_gsSqueakTemp_stopIndex - _gsSqueakTemp_startIndex + 1))]]
				ifFalse: [self closeTypeIn]].
	self openTypeInFor: #forwardDelete.
	self zapSelectionWith: self nullText.
	^ false