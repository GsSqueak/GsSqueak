invocation
startUp: initialSelection
	"Build and invoke this menu with the given initial selection. Answer the selection associated with the menu item chosen by the user or nil if none is chosen."

	^ self startUp: initialSelection withCaption: title