basic control sequence
startUpWithCaption: captionOrNil at: location allowKeyboard: aBoolean
	"Overridden to return value returned by manageMarker.  The boolean parameter indicates whether the menu should be given keyboard focus (if in morphic)"

	| index |
	index := super startUpWithCaption: captionOrNil at: location allowKeyboard: aBoolean.
	(selections isNil or: [(index between: 1 and: selections size) not])
		ifTrue: [^ nil].
	^ selections at: index