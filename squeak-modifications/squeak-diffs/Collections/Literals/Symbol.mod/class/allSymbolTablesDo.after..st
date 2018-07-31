class initialization
allSymbolTablesDo: aBlock after: anElement
    | array index endIndex |
    
    array := self allSymbols.
    anElement
		ifNil: [ index := 0 ]
		ifNotNil: [ 
			index := array indexOf: anElement.
	endIndex := array size.
	[ (index := index + 1) <= endIndex ] whileTrue: [
		(array at: index) ifNotNil: [ :object |
			aBlock value: object ] ] ]

