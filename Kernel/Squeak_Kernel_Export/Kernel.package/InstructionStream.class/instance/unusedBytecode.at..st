private
unusedBytecode: client at: targetPC
	[client unusedBytecode]
		on: MessageNotUnderstood
		do: [:ex|
			(ex receiver == client
			 and: [ex message selector == #unusedBytecode])
				ifTrue: [self error: 'unusedBytecode']
				ifFalse: [ex pass]]