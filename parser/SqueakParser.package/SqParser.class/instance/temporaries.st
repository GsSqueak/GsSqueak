expression types
temporaries
	"[ '|' (variable)* '|' ]"
	| vars theActualText |
	(self match: #verticalBar)
		ifFalse: ["no temps"
			doitFlag
				ifTrue: [tempsMark := self interactive
								ifTrue: [cue requestor selectionInterval first]
								ifFalse: [1].
					^ #()].
			tempsMark := hereMark.
			"formerly --> prevMark + prevToken"
			tempsMark > 0
				ifTrue: [theActualText := source contents.
					[tempsMark < theActualText size
						and: [(theActualText at: tempsMark) isSeparator]]
						whileTrue: [tempsMark := tempsMark + 1]].
			^ #()].
	vars := OrderedCollection new.
	[hereType == #word]
		whileTrue: [vars
				addLast: (encoder bindTemp: self advance)].
	(self match: #verticalBar)
		ifTrue: [tempsMark := prevMark.
			^ vars].
	^ self expected: 'Vertical bar'