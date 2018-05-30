futures
future: receiver send: aSelector at: deltaMSecs args: args
	"Send a message deltaSeconds into the future.  Answers a Promise that will be resolved at some time in the future."
	| pr closure |
	pr := Promise new.
	closure := [pr resolveWith: (receiver perform: aSelector withArguments: args)].
	deltaMSecs = 0
		ifTrue: [self addDeferredUIMessage: closure]
		ifFalse: [
			world 
				addAlarm: #addDeferredUIMessage: 
				withArguments: {closure}
				for: self
				at: (Time millisecondClockValue + deltaMSecs)
		].
	^pr
		