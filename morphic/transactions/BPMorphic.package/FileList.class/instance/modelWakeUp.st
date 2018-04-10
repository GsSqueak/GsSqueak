initialization
modelWakeUp
	"User has entered or expanded the window -- reopen any remote
	connection. "
	(directory notNil
			and: [directory isRemoteDirectory])
		ifTrue: [[directory wakeUp]
				on: TelnetProtocolError
				do: [:ex | self inform: ex printString]
			"It would be good to implement a null method wakeUp on the
			root of directory"]