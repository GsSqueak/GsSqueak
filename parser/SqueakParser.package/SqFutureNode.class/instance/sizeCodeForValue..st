code generation
sizeCodeForValue: encoder 
	receiver == NodeSuper
		ifTrue: [^ self error: 'Futures cannot send to future'].
	(futureArgs isNil
			or: [futureSelector isNil])
		ifTrue: [^ self error: 'Futures must be sent messages'].
	encoder sharableLitIndex: originalSelector.
	"to find its senders"
	futureDelta
		ifNil: [futureDelta := encoder encodeLiteral: 0].
	valueNode := SqMessageNode new
				receiver: receiver
				selector: #futureSend:at:args:
				arguments: (Array
						with: (encoder encodeLiteral: futureSelector)
						with: futureDelta
						with: (SqBraceNode new elements: futureArgs))
				precedence: 3
				from: encoder.
	^ valueNode sizeCodeForValue: encoder