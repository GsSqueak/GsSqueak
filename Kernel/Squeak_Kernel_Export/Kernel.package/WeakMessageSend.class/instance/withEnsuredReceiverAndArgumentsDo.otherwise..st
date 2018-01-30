private
withEnsuredReceiverAndArgumentsDo: aBlock otherwise: altBlock
	"Grab real references to receiver and arguments. If they still exist, evaluate aBlock."

	"Return if my receiver has gone away"
	| r a |
	r := self receiver.
	r ifNil: [ ^altBlock value ].

	
	"Make sure that my arguments haven't gone away"
	a := Array withAll: self arguments.
	a with: shouldBeNil do: [ :arg :flag |
		arg ifNil: [ flag ifFalse: [ ^altBlock value ]]
	].

	^aBlock value: r value: a