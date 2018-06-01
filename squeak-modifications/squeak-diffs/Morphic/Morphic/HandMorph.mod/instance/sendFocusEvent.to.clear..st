private events
sendFocusEvent: anEvent to: focusHolder clear: aBlock
	"Send the event to the morph currently holding the focus"

	| result w |
	w := focusHolder world ifNil: [aBlock value. ^ anEvent].
	w becomeActiveDuring: [
		self becomeActiveDuring: [
			anEvent becomeActiveDuring: [
				result := focusHolder processFocusEvent: anEvent]]].
	^ result == #rejected ifTrue: [anEvent] ifFalse: [result "filtered event"]