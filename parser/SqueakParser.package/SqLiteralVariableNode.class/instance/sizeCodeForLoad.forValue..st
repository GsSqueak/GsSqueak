code generation
sizeCodeForLoad: encoder forValue: forValue 
	self reserve: encoder.
	^ (key isVariableBinding
			and: [key isSpecialWriteBinding
					and: [forValue not]])
		ifTrue: [encoder sizePushLiteral: index]
		ifFalse: [0]