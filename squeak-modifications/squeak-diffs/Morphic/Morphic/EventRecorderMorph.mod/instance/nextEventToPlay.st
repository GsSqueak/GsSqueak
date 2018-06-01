event handling
nextEventToPlay
	"Return the next event when it is time to be replayed.
	If it is not yet time, then return an interpolated mouseMove.
	Return nil if nothing has happened.
	Return an EOF event if there are no more events to be played."
	| nextEvent now nextTime lastP delta |
	(tapeStream isNil or:[tapeStream atEnd]) 
		ifTrue:[^MorphicUnknownEvent new setType: #EOF argument: nil].
	now := Time millisecondClockValue.
	nextEvent := tapeStream next.
	"nextEvent isKeyboard ifTrue: [ nextEvent setPosition: self position ]."
	deltaTime ifNil:[deltaTime := now - nextEvent timeStamp].
	nextTime := nextEvent timeStamp + deltaTime.
	now < time ifTrue:["clock rollover"
		time := now.
		deltaTime := nil.
		^nil "continue it on next cycle"].
	time := now.
	(now >= nextTime) ifTrue:[
		nextEvent := nextEvent copy setTimeStamp: nextTime.
		nextEvent isMouse ifTrue:[lastEvent := nextEvent] ifFalse:[lastEvent := nil].
		^nextEvent].
	tapeStream skip: -1.
	"Not time for the next event yet, but interpolate the mouse.
	This allows tapes to be compressed when velocity is fairly constant."
	lastEvent ifNil: [^ nil].
	lastP := lastEvent position.
	delta := (nextEvent position - lastP) * (now - lastEvent timeStamp) // (nextTime - lastEvent timeStamp).
	delta = lastDelta ifTrue: [^ nil]. "No movement"
	lastDelta := delta.
	^MouseMoveEvent new
		setType: #mouseMove 
		startPoint: lastEvent position endPoint: lastP + delta
		trail: #() buttons: lastEvent buttons hand: nil stamp: now.