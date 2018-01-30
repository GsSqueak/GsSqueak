very few messages
xxxViewedObject: viewedObject evaluate: block1 wheneverChangeIn: block2
	"This message name must not clash with any other (natch)."
	tracedObject := viewedObject.
	valueBlock := block2.
	changeBlock := block1.
	recursionFlag := false