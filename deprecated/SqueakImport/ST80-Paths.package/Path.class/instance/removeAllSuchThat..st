removing
removeAllSuchThat: aBlock 
	"Evaluate aBlock for each element of the receiver.
	Remove each element for which aBlock evaluates to true."

	collectionOfPoints removeAllSuchThat: aBlock.
