browser requests
waitBrowserReadyFor: timeout ifFail: errorBlock
	| startTime delay okay |
	okay := self primBrowserReady.
	okay ifNil:[^errorBlock value].
	okay ifTrue: [^true].
	startTime := Time millisecondClockValue.
	delay := Delay forMilliseconds: 100.
	[(Time millisecondsSince: startTime) < timeout]
		whileTrue: [
			delay wait.
			okay := self primBrowserReady.
			okay ifNil:[^errorBlock value].
			okay ifTrue: [^true]].
	^errorBlock value