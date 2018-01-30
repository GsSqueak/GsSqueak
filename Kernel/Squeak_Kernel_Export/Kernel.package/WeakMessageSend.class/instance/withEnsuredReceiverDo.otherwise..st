private
withEnsuredReceiverDo: aBlock otherwise: altBlock
	"Grab a real reference to receive. If still there, evaluate aBlock.
	Use altBlock if my receiver has gone away."
	^self receiver
		ifNil: [ altBlock value ]
		ifNotNil: [:r | aBlock value: r ]