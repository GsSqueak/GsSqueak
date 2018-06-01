debugging
doOnlyOnce: aBlock
	"If the 'one-shot' mechanism is armed, evaluate aBlock once and disarm the one-shot mechanism.  To rearm the mechanism, evaluate  'self rearmOneShot' manually."

	(Smalltalk at: #OneShotArmed ifAbsent: [true])
		ifTrue:
			[Smalltalk at: #OneShotArmed put: false.
			aBlock value]
