enumerating
allSubclassesDoGently: aBlock 
	"Evaluate the argument, aBlock, for each of the receiver's subclasses."

	self subclassesDoGently: 
		[:cl | 
		cl isInMemory ifTrue: [
			aBlock value: cl.
			cl allSubclassesDoGently: aBlock]]
