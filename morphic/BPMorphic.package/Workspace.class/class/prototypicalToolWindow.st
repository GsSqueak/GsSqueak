instance creation
prototypicalToolWindow
	"Answer an example of myself seen in a tool window, for the benefit of
	parts-launching tools"
	| _gsSqueakTemp_aWorkspace |
	_gsSqueakTemp_aWorkspace := ToolBuilder build: self new.
	^ _gsSqueakTemp_aWorkspace