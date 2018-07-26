printing
timeStamp
	"Answer the authoring time-stamp for the given method, retrieved from the sources or changes file. Answer the empty string if no time stamp is available."
	"(CompiledMethod compiledMethodAt: #timeStamp) timeStamp"

	| preamble stamp tokens tokenCount |
	stamp := nil.
	preamble := self preamble.
	tokens := (preamble findString: 'methodsFor:' startingAt: 1) > 0
		ifTrue: [Scanner new scanTokens: preamble]
		ifFalse: [#()  "ie cant be back ref"].
	(((tokenCount := tokens size) between: 7 and: 8) and: [(tokens at: tokenCount - 5) == #methodsFor:])
		ifTrue:
			[(tokens at: tokenCount - 3) == #stamp:
				ifTrue: ["New format gives change stamp and unified prior pointer"
						stamp := tokens at: tokenCount - 2]].
	((tokenCount between: 5 and: 6) and: [(tokens at: tokenCount - 3) == #methodsFor:])
		ifTrue:
			[(tokens at: tokenCount  - 1) == #stamp:
				ifTrue: ["New format gives change stamp and unified prior pointer"
					stamp := tokens at: tokenCount]].
	^stamp ifNil: [ String new ]
