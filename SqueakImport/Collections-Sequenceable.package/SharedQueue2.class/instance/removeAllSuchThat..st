accessing
removeAllSuchThat: aBlock
	"Remove from the queue all objects that satisfy aBlock."
	monitor critical: [
		items removeAllSuchThat: aBlock ]