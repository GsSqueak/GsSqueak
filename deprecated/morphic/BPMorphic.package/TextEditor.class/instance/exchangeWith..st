private
exchangeWith: prior 
	"If the prior selection is non-overlapping and legal, exchange the text
	of it with the current selection and leave the currently selected text
	selected in the location of the prior selection (or leave a caret after a
	non-caret if it was
	exchanged with a caret). If both selections are carets, flash & do
	nothing. Don't affect the paste buffer."
	| _gsSqueakTemp_start _gsSqueakTemp_stop _gsSqueakTemp_before _gsSqueakTemp_selection _gsSqueakTemp_priorSelection _gsSqueakTemp_delta _gsSqueakTemp_altInterval |
	_gsSqueakTemp_start := self startIndex.
	_gsSqueakTemp_stop := self stopIndex - 1.
	((prior first <= prior last
				and: [_gsSqueakTemp_start <= _gsSqueakTemp_stop])
			and: [self isDisjointFrom: prior])
		ifFalse: [morph flash.
			^ self].
	_gsSqueakTemp_before := prior last < _gsSqueakTemp_start.
	_gsSqueakTemp_selection := self selection.
	_gsSqueakTemp_priorSelection := paragraph text copyFrom: prior first to: prior last.
	_gsSqueakTemp_delta := _gsSqueakTemp_before
				ifTrue: [0]
				ifFalse: [_gsSqueakTemp_priorSelection size - _gsSqueakTemp_selection size].
	"Create first undo command."
	self replaceSelectionWith: _gsSqueakTemp_priorSelection.
	self history previous isCompositeRedo: true.
	self selectInvisiblyFrom: prior first + _gsSqueakTemp_delta to: prior last + _gsSqueakTemp_delta.
	_gsSqueakTemp_delta := _gsSqueakTemp_before
				ifTrue: [_gsSqueakTemp_stop - prior last]
				ifFalse: [_gsSqueakTemp_start - prior first].
	"Create second undo command."
	self replaceSelectionWith: _gsSqueakTemp_selection.
	self history previous isCompositeUndo: true.
	_gsSqueakTemp_altInterval := prior first + _gsSqueakTemp_delta to: prior last + _gsSqueakTemp_delta.
	"If one was a caret, make it otherInterval & leave the caret after the
	other "
	prior first > prior last
		ifTrue: [self selectAt: prior last + 1].
	otherInterval := _gsSqueakTemp_start > _gsSqueakTemp_stop
				ifTrue: [self selectAt: _gsSqueakTemp_altInterval last + 1.
					prior]
				ifFalse: [_gsSqueakTemp_altInterval]