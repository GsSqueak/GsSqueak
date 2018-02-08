public query
defaultInputInterpreter
	InputInterpreterClass
		ifNil: [InputInterpreterClass := self inputInterpreterClass].
	^ InputInterpreterClass new