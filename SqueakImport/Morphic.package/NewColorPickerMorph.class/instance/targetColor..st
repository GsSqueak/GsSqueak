accessing
targetColor: aColor 
	"The color of my target."
	target ifNotNil:
		[ target
			perform: setColorSelector
			with: aColor ]