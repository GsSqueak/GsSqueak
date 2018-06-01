code generation
sizeCodeForBlockValue: encoder 
	receiver == NodeSuper
		ifTrue: [^ self error: 'Futures cannot send to future'].
	(futureArgs isNil
			or: [futureSelector isNil])
		ifTrue: [^ self error: 'Futures must be sent messages'].
	encoder sharableLitIndex: originalSelector.
	"to find its senders"
	futureDelta
		ifNil: [futureDelta := encoder encodeLiteral: 0].
	effectNode := SqMessageNode new
				receiver: receiver
				selector: #futureDo:at:args:
				arguments: (Array
						with: (encoder encodeLiteral: futureSelector)
						with: futureDelta
						with: (SqBraceNode new elements: futureArgs))
				precedence: 3
				from: encoder.
	^ effectNode sizeCodeForValue: encoder