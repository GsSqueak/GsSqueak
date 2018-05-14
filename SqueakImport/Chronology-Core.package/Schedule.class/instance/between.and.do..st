enumerating
between: aStart and: anEnd do: aBlock

	| element end i |
	end := self end min: anEnd.
	element := self start.
	
	i := 1.
	[ element < aStart ] whileTrue:
	
	[ element := element + (schedule at: i).
		i := i + 1. (i > schedule size) ifTrue: [i := 1]].
	i := 1.
	[ element <= end ] whileTrue:
	
	[ aBlock value: element.
		element := element + (schedule at: i).
		i := i + 1.
		(i > schedule size) ifTrue: [i := 1]]
