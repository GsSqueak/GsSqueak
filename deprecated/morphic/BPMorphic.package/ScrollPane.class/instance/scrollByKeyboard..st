event handling
scrollByKeyboard: event 
	"If event is ctrl+up/down then scroll and answer true. Backwards
	compatibility. "
	(event controlKeyPressed
			or: [event commandKeyPressed
				"??? key decode table in event sensor does not change
				CTRL+up/down !!!"])
		ifFalse: [^ false].
	event keyCharacter = Character arrowUp
		ifTrue: [scrollBar scrollUp: 3.
			^ true].
	event keyCharacter = Character arrowDown
		ifTrue: [scrollBar scrollDown: 3.
			^ true].
	"event keyCharacter = Character arrowRight
	ifTrue: 
	[hScrollBar scrollDown: 3.
	^ true].
	event keyCharacter = Character arrowLeft
	ifTrue: 
	[hScrollBar scrollUp: 3.
	^ true]."
	^ false