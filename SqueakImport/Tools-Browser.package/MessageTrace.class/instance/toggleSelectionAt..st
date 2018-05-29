actions
toggleSelectionAt: currentPosition
	"Compatibility with MVC"

	^ self
		toggleSelectionAt: currentPosition
		shifted: false
		controlled: false