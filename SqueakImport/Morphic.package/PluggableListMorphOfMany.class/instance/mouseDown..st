event handling
mouseDown: event
	| oldIndex oldVal row index |
	event yellowButtonPressed ifTrue: [^ self yellowButtonActivity: event shiftPressed].
	row := self rowAtLocation: event position.

	row = 0 ifTrue: [^super mouseDown: event].
	index := self modelIndexFor: row.

	model okToChange ifFalse: [^ self].  "No change if model is locked"

	"Set meaning for subsequent dragging of selection"
	dragOnOrOff := (self listSelectionAt: index) not.
	oldIndex := self getCurrentSelectionIndex.
	oldIndex ~= 0 ifTrue: [oldVal := self listSelectionAt: oldIndex].

	"Set or clear new primary selection (listIndex)"
	dragOnOrOff
		ifTrue: [self changeModelSelection: index]
		ifFalse: [self changeModelSelection: 0].

	"Need to restore the old one, due to how model works, and set new one."
	oldIndex ~= 0 ifTrue: [self listSelectionAt: oldIndex put: oldVal].
	self listSelectionAt: index put: dragOnOrOff.
	"event hand releaseMouseFocus: aMorph."
