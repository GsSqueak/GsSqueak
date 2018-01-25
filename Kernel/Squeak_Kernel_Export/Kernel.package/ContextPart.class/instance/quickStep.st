system simulation
quickStep
	"If the next instruction is a send, just perform it.
	Otherwise, do a normal step."

	self willReallySend ifTrue: [QuickStep := self].
	^self step