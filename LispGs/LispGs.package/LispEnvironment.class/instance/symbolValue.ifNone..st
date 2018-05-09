as yet unclassified
symbolValue: aSymbol ifNone: aBlock 
	"look-up for the value bound to aSymbol. if none found, evaluate
	aBlock"
	| b |
	b := self symbolBinding: aSymbol.
	b ifNotNil: [^ b value].
	^ (self parent
		ifNil: [^ aBlock value])
		symbolValue: aSymbol
		ifNone: aBlock
