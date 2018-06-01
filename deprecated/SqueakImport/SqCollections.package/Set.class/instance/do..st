enumerating
do: aBlock 

	tally = 0 ifTrue: [ ^self ].
	1 to: array size do: [ :index |
		(array at: index) ifNotNil: [ :element |
			aBlock value: element enclosedSetElement] ]