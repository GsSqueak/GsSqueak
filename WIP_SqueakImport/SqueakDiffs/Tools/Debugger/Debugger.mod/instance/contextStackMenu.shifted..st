context stack menu
contextStackMenu: aMenu shifted: shifted
	"Set up the menu appropriately for the context-stack-list, either shifted or unshifted as per the parameter provided"

	^ self menu: aMenu for: #(contextStackMenu contextStackMenuShifted:) shifted: shifted
