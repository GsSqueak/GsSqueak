enumerating
select: aBlock 
	"Evaluate aBlock with each of my elements as the argument. Collect into
	a new collection like the receiver, only those elements for which aBlock
	evaluates to true."

	| newCollection |
	newCollection := self copyEmpty.
	1 to: tally do: [ :index |
		| element |
		(aBlock value: (element := array at: index)) ifTrue: [
			newCollection add: element ] ].
	^ newCollection