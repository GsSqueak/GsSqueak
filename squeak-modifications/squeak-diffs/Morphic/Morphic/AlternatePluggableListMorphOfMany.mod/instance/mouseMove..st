event handling
mouseMove: event 
	"The mouse has moved, as characterized by the event provided.  Adjust the scrollbar, and alter the selection as appropriate"

	| oldIndex oldVal row |
	event position y < self top 
		ifTrue: 
			[scrollBar scrollUp: 1.
			row := self rowAtLocation: scroller topLeft + (1 @ 1)]
		ifFalse: 
			[row := event position y > self bottom 
				ifTrue: 
					[scrollBar scrollDown: 1.
					self rowAtLocation: scroller bottomLeft + (1 @ -1)]
				ifFalse: [ self rowAtLocation: event position]].
	row = 0 ifTrue: [^super mouseDown: event].

	model okToChange ifFalse: [^self].	"No change if model is locked"

	"Set meaning for subsequent dragging of selection"
	oldIndex := self getCurrentSelectionIndex.
	oldIndex ~= 0 ifTrue: [oldVal := self listSelectionAt: oldIndex].
	"Need to restore the old one, due to how model works, and set new one."
	oldIndex ~= 0 ifTrue: [self listSelectionAt: oldIndex put: oldVal].

	"Inform model of selected item and let it toggle."
	self 
		changeModelSelection: (self modelIndexFor: row)
		shifted: true
		controlled: true.
	submorphs do: [:each | each changed]