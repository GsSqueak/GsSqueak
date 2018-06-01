public
do: aBlock after: anElement

	| index endIndex |
	tally = 0 ifTrue: [ ^self ].
	anElement
		ifNil: [ index := 0 ]
		ifNotNil: [ 
			index := self scanFor: anElement.
			(array at: index) == flag ifTrue: [
				index := 0 ] ].
	endIndex := array size.
	[ (index := index + 1) <= endIndex ] whileTrue: [
		(array at: index) ifNotNil: [ :object |
			object == flag ifFalse: [
				aBlock value: object enclosedSetElement] ] ]