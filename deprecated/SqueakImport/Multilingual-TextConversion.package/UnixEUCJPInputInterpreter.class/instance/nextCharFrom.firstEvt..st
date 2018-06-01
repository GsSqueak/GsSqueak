as yet unclassified
nextCharFrom: sensor firstEvt: evtBuf

	| firstChar secondChar peekEvent keyValue type stream multiChar |
	keyValue := evtBuf third.
	evtBuf fourth = EventKeyChar ifTrue: [type := #keystroke].
	peekEvent := sensor peekEvent.
	(peekEvent notNil and: [peekEvent fourth = EventKeyDown]) ifTrue: [
		sensor nextEvent.
		peekEvent := sensor peekEvent].

	(type == #keystroke
	and: [peekEvent notNil 
	and: [peekEvent first = EventTypeKeyboard
	and: [peekEvent fourth = EventKeyChar]]]) ifTrue: [
		firstChar := keyValue asCharacter.
		secondChar := (peekEvent third) asCharacter.
		stream := ReadStream on: (String with: firstChar with: secondChar).
		multiChar := converter nextFromStream: stream.
		multiChar isOctetCharacter ifFalse: [sensor nextEvent].
		^ multiChar].

	^ keyValue asCharacter