constructor
decodeLiteralVariableValueDereferenceWithReceiver: receiver selector: selector arguments: arguments 
	| varNode |
	(receiver notNil
			and: ["cascades"
				receiver isLiteralNode
					and: [receiver key isVariableBinding]])
		ifFalse: [^ nil].
	varNode := self codeAnyLitInd: receiver key.
	selector = #value
		ifTrue: [^ varNode].
	^ selector = #value:
		ifTrue: [self codeAssignTo: varNode value: arguments first]