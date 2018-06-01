slot getters/setters
setRotationStyle: aStyleSymbol 
	"Set the rotation style to the indicated symbol; the external symbols
	seen are different, as you'll observe..."
	costume renderedMorph
		rotationStyle: (#(#normal #none #leftRight #upDown )
				at: (#(#rotate #'do not rotate' #'flip left right' #'flip up down' ) indexOf: aStyleSymbol))