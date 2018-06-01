constructor
decodeIfNilWithReceiver: receiver selector: selector arguments: arguments 
	receiver
		ifNil: [^ nil].
	"For instance, when cascading"
	selector == #ifTrue:ifFalse:
		ifFalse: [^ nil].
	(receiver
			isMessage: #==
			receiver: nil
			arguments: [:argNode | argNode == NodeNil])
		ifFalse: [^ nil].
	^ (SqMessageNode new
		receiver: receiver
		selector: (SqSelectorNode new key: #ifTrue:ifFalse: code: #macro)
		arguments: arguments
		precedence: 3)
		noteSpecialSelector: #ifNil:ifNotNil: