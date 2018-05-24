private events
sendEvent: anEvent focus: focusHolder clear: aBlock
	"Send the event to the morph currently holding the focus, or if none to the owner of the hand."

	| result w |
	focusHolder ifNotNil:[^self sendFocusEvent: anEvent to: focusHolder clear: aBlock].
	w := self world.
	w becomeActiveDuring: [
		self becomeActiveDuring: [
				anEvent becomeActiveDuring: [
					result := w processEvent: anEvent]]].
	^ result == #rejected ifTrue: [anEvent] ifFalse: [result "filtered event"]