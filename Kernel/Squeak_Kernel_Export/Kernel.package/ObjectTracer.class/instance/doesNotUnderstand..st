very few messages
doesNotUnderstand: aMessage 
	"All external messages (those not caused by the re-send) get trapped here"
	"Present a dubugger before proceeding to re-send the message"

	ToolSet debugContext: thisContext
				label: 'About to perform: ', aMessage selector
				contents: nil.
	^ aMessage sentTo: tracedObject.
