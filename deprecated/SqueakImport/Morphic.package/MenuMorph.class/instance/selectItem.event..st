control
selectItem: aMenuItem event: anEvent
	"Change the selected item." 
	
	selectedItem ifNotNil:[selectedItem deselect: anEvent].
	selectedItem := aMenuItem.
	selectedItem ifNotNil:[selectedItem select: anEvent].