private
getNextRemoteEvent
	"Return the next remote event, or nil if the receive buffer does not contain a full event record. An event record is the storeString for a MorphicEvent terminated by a <CR> character."

	| i s evt |
	self receiveData.
	receiveBuffer isEmpty ifTrue: [^ nil].

	i := receiveBuffer indexOf: Character cr ifAbsent: [^ nil].
	s := receiveBuffer copyFrom: 1 to: i - 1.
	receiveBuffer := receiveBuffer copyFrom: i + 1 to: receiveBuffer size.
	evt := (MorphicEvent readFromString: s).
	evt ifNil:[^nil].
	evt setHand: self.
	evt isKeyboard ifTrue:[evt setPosition: self position].
	^evt resetHandlerFields