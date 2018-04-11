event handling
keyboardFocusChange: weHaveFocus 
	"Overwritten because we do not want to release the editor if we do not
	have the focus. Editors and their paragraphs store the text selection,
	which we want to reuse after getting keyboard focus again. This
	supports keyboard navigation."
	paragraph
		ifNotNil: [:para | para focused: weHaveFocus].
	weHaveFocus
		ifTrue: [self hasFocus
				ifFalse: [self editor
					"forces install"].
			Editor blinkingCursor
				ifTrue: [self startBlinking]
				ifFalse: [self resetBlinkCursor
					"ensure caret visible"]]
		ifFalse: [self stopBlinking].
	self changed.
	"Tell my edit-view about this because I am his delegate."
	self editView keyboardFocusChange: weHaveFocus