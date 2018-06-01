converting
nextCharFrom: sensor firstEvt: evtBuf
	"Compose Unicode character sequences"
	| peekEvent keyValue composed |
	"Only try this if the first event is composable and is a character event"
	((Unicode isComposable: (keyValue := evtBuf sixth)) 
		and:[evtBuf fourth = EventKeyChar]) ifTrue:[
			"If we have a pending keyDown in the queue, skip that to get to the keystroke"
			peekEvent := sensor peekEvent.
			(peekEvent notNil and: [peekEvent fourth = EventKeyDown]) ifTrue: [
				"skipEvent := "sensor nextEvent.
				peekEvent := sensor peekEvent].
			"If we have another character event in the queue, compose it"
			(peekEvent notNil 
				and: [peekEvent first = EventTypeKeyboard 
				and:[peekEvent fourth = EventKeyChar]]) ifTrue:[
					composed := Unicode compose: keyValue with: peekEvent sixth.
					composed ifNotNil:[
						sensor nextEvent.
						^composed]]].
	"XXXX: Fixme. We should put the skipped event back if we haven't consumed it."
	^keyValue asCharacter