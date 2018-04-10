slot getters/setters
getRotationStyle
	"Answer the symbol representing the rotation style"
	^ #(#rotate #'do not rotate' #'flip left right' #'flip up down' )
		at: (#(#normal #none #leftRight #upDown ) indexOf: costume renderedMorph rotationStyle)