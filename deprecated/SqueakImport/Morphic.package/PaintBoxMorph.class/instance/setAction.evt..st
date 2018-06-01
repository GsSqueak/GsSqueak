actions
setAction: aSelector evt: evt
	"Find this button and turn it on.  Does not work for stamps or pickups"

	| button |
	button := self submorphNamed: aSelector.
 
	button ifNotNil: [
		button state: #on.
		button doButtonAction: evt].	"select it!"