event handling
processEvents
	"Process user input events from the remote input devices."

	| evt |
	evt := self getNextRemoteEvent.
	[evt notNil] whileTrue: 
			[evt type == #worldExtent 
				ifTrue: 
					[remoteWorldExtent := evt argument.
					^self].
			self handleEvent: evt.
			evt := self getNextRemoteEvent]