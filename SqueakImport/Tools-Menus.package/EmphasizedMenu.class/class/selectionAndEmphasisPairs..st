instance creation
selectionAndEmphasisPairs: interleavedList
	"An alternative form of call.  "
	| selList  emphList |
	selList := OrderedCollection new.
	emphList := OrderedCollection new.
	interleavedList pairsDo:
		[:aSel :anEmph |
			selList add: aSel.
			emphList add: anEmph].
	^ self selections:selList emphases: emphList