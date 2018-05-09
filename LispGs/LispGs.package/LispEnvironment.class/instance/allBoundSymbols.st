as yet unclassified
allBoundSymbols
	| env |
	env := self.
	^ (Array
		streamContents: [:str | [env notNil]
				whileTrue: [str nextPutAll: env symbolValues keys.
					env := env parent]]) sort