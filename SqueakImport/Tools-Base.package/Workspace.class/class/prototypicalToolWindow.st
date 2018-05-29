instance creation
prototypicalToolWindow
	"Answer an example of myself seen in a tool window, for the benefit of parts-launching tools"

	| aWorkspace |
	aWorkspace := ToolBuilder build: self new.
	^ aWorkspace