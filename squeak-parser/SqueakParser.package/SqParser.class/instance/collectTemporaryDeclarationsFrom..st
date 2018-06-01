error correction
collectTemporaryDeclarationsFrom: methodNode 
	| tempsMarks str |
	tempsMarks := OrderedCollection new.
	str := cue requestor text asString.
	methodNode
		accept: (SqParseNodeEnumerator
				ofBlock: [:aNode | | mark | (aNode class canUnderstand: #tempsMark)
						ifTrue: [mark := aNode tempsMark.
							(mark notNil
									and: [mark between: 1 and: str size]
									and: [(str at: mark)
											= $|])
								ifTrue: [tempsMarks addLast: aNode]]]).
	(tempsMark notNil
			and: [tempsMark between: 1 and: str size]
			and: [(str at: tempsMark)
					= $|])
		ifTrue: [tempsMarks addLast: self].
	^ tempsMarks
		sorted: [:a :b | a tempsMark > b tempsMark]