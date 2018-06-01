private
updateFromParagraph
	"A change has taken place in my paragraph, as a result of editing and
	I must be updated. If a line break causes recomposition of the current
	paragraph, or it the selection has entered a different paragraph, then
	the current editor will be released, and must be reinstalled with the
	resulting new paragraph, while retaining any editor state, such as
	selection, undo state, and current typing emphasis."
	| _gsSqueakTemp_newStyle _gsSqueakTemp_sel _gsSqueakTemp_oldLast _gsSqueakTemp_oldEditor _gsSqueakTemp_back |
	paragraph
		ifNil: [^ self].
	wrapFlag
		ifNil: [wrapFlag := true].
	editor
		ifNotNil: [_gsSqueakTemp_oldEditor := editor.
			_gsSqueakTemp_sel := editor selectionInterval.
			editor storeSelectionInParagraph].
	text := paragraph text.
	paragraph textStyle = textStyle
		ifTrue: [self fit]
		ifFalse: ["Broadcast style changes to all morphs"
			_gsSqueakTemp_newStyle := paragraph textStyle.
			(self firstInChain text: text textStyle: _gsSqueakTemp_newStyle) recomposeChain.
			editor
				ifNotNil: [self installEditorToReplace: editor]].
	(self isAutoFit
			and: [self isWrapped not])
		ifTrue: [self extent: self paragraph extent;
				 composeToBounds]
		ifFalse: [super layoutChanged].
	_gsSqueakTemp_sel
		ifNil: [^ self].
	"If selection is in top line, then recompose predecessor for possible
	ripple-back "
	predecessor
		ifNotNil: [_gsSqueakTemp_sel first <= (self paragraph lines first last + 1)
				ifTrue: [_gsSqueakTemp_oldLast := predecessor lastCharacterIndex.
					predecessor paragraph
						recomposeFrom: _gsSqueakTemp_oldLast
						to: text size
						delta: 0.
					_gsSqueakTemp_oldLast = predecessor lastCharacterIndex
						ifFalse: [predecessor changed.
							"really only last line"
							self predecessorChanged]]].
	((_gsSqueakTemp_back := predecessor notNil
						and: [_gsSqueakTemp_sel first <= self paragraph firstCharacterIndex])
			or: [successor notNil
					and: [_gsSqueakTemp_sel first > (self paragraph lastCharacterIndex + 1)]])
		ifTrue: ["The selection is no longer inside this paragraph.
			Pass focus to the paragraph that should be in control."
			_gsSqueakTemp_back
				ifTrue: [predecessor recomposeChain]
				ifFalse: [self recomposeChain].
			self firstInChain
				withSuccessorsDo: [:m | (_gsSqueakTemp_sel first between: m firstCharacterIndex and: m lastCharacterIndex + 1)
						ifTrue: [m installEditorToReplace: _gsSqueakTemp_oldEditor.
							^ self passKeyboardFocusTo: m]].
			self error: 'Inconsistency in text editor'
			"Must be somewhere in the successor chain"].
	editor
		ifNil: ["Reinstate selection after, eg, style change"
			self installEditorToReplace: _gsSqueakTemp_oldEditor]