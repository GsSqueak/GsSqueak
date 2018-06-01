instance creation
prototypicalToolWindow
	"Answer an example of myself seen in a tool window, for the benefit of parts-launching tools"

	| aWindow |
	aWindow := ToolBuilder build: self new.
	aWindow setLabel: 'Selector Browser'.
	aWindow applyModelExtent.
	^ aWindow