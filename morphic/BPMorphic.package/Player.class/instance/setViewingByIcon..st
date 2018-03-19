slot getters/setters
setViewingByIcon: aVal 
	"Set the user's costume's view-by-icon attribute as indictated"
	aVal == false
		ifTrue: ["problematical - we always need *some* view"
			costume renderedMorph viewByName]
		ifFalse: [costume renderedMorph viewByIcon]