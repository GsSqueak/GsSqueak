accessing
defaultCanvasClass
	"Return the default canvas used for drawing onto the receiver"
	Display
	ifNotNil: [
	    ^ Display defaultCanvasClass ]
	ifNil: [
	    ^ FormCanvas ]
