construction
createDockingBar
	"Create a docking bar from the receiver's representation"
	
	| dockingBar |
	dockingBar := DockingBarMorph new
		adhereToTop;
		borderWidth: 0.
	self fillDockingBar: dockingBar.
	self labelIfNeeded: dockingBar.
	^ dockingBar