events-processing
handleListenEvent: anEvent
	"Record the given event"
	anEvent hand == recHand ifFalse: [^ self].	"not for me"
	state == #record ifFalse: [
		"If user got an error while recording and deleted recorder, will still be listening"
		recHand ifNotNil: [recHand removeEventListener: self].
		^self].
	anEvent = lastEvent ifTrue: [^ self].
	(anEvent isKeyboard and:[anEvent keyValue = 27 "esc"])
		ifTrue: [^ self stop].
	time := anEvent timeStamp.
	tapeStream nextPut: (anEvent copy setHand: nil).
	journalFile ifNotNil:
		[journalFile store: anEvent; cr; flush].
	lastEvent := anEvent.