accessing-selection
markIndex: anIndex pointIndex: anotherIndex 
	"Called, for example, when selecting text with shift+arrow keys"
	markBlock := paragraph characterBlockForIndex: anIndex.
	pointBlock := paragraph characterBlockForIndex: anotherIndex