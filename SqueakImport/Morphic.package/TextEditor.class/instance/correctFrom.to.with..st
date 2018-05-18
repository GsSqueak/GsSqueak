new selection
correctFrom: start to: stop with: aString
	"Make a correction in the model that the user has authorised from somewhere else in the system (such as from the compilier).  The user's selection is not changed, only corrected."
	| userSelection delta loc wasShowing |
	aString = '#insert period' ifTrue: [
		loc := start.
		[(loc := loc-1)>0 and: [(paragraph string at: loc) isSeparator]]
			whileTrue: [loc := loc-1].
		^ self correctFrom: loc+1 to: loc with: '.'].
	(wasShowing := selectionShowing) ifTrue: [ self reverseSelection ].
	userSelection := self selectionInterval.

	self selectInvisiblyFrom: start to: stop.
	self replaceSelectionWith: aString.

	delta := aString size - (stop - start + 1).
	self
		selectInvisiblyFrom: userSelection first + (userSelection first > start ifFalse: [ 0 ] ifTrue: [ delta ])
		to: userSelection last + (userSelection last > start ifFalse: [ 0 ] ifTrue: [ delta ]).
	wasShowing ifTrue: [ self reverseSelection ].
