private
withEnsuredReceiverAndArgumentsDo: aBlock withEnoughArguments: anArray otherwise: altBlock
	"call the selector with enough arguments from arguments and anArray"
	| r selfArgs enoughArgs |
	r := self receiver.
	r ifNil: [ ^altBlock value ].
	
	selfArgs := self arguments.
	selfArgs with: shouldBeNil do: [ :arg :flag |
		arg ifNil: [ flag ifFalse: [ ^altBlock value ]]
	].

	enoughArgs := Array new: selector numArgs.
	enoughArgs replaceFrom: 1
		to: ( selfArgs size min: enoughArgs size)
		with: selfArgs
		startingAt: 1.
	enoughArgs size > selfArgs size ifTrue: [
		enoughArgs replaceFrom: selfArgs size + 1
			to: (selfArgs size + anArray size min: enoughArgs size)
			with: anArray
			startingAt: 1.
	].
	^aBlock value: r value: enoughArgs