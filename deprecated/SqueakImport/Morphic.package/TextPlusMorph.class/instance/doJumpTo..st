as yet unclassified
doJumpTo: aString

	| myStart myStop |
	myStart := myStop := nil.
	text runs withStartStopAndValueDo: [:start :stop :attributes |
		attributes do: [:att |
			((att isMemberOf: TextPlusJumpEnd) and: [att jumpLabel = aString]) ifTrue: [
				myStart 
					ifNil: [myStart := start. myStop := stop] 
					ifNotNil: [myStart := myStart min: start. myStop := myStop max: stop].
			]
		]
	].
	myStart ifNil: [^self].

	self editor selectFrom: myStart to: myStop.
	ignoreNextUp := true.
	self changed.
	self scrollSelectionToTop.
