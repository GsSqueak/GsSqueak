accessing
flushAllSuchThat: aBlock
	"Remove from the queue all objects that satisfy aBlock."
	
	accessProtect critical: [
		| newReadPos |
		newReadPos := writePosition.
		writePosition - 1 to: readPosition by: -1 do: [ :i |
			| value |
			value := contentsArray at: i.
			contentsArray at: i put: nil.
			((aBlock value: value) and: [ (readSynch waitIfLocked: [ nil ]) notNil ]) ifFalse: [
				newReadPos := newReadPos - 1.
				contentsArray at: newReadPos put: value ] ].
		readPosition := newReadPos ]