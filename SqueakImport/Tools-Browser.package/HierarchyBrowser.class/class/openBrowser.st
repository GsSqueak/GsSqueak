instance creation
openBrowser
	"Open a default hierarchy browser on Object - ie the entire class tree, so it may take a moment -  with class/protocol/message lists"
	"HierarchyBrowser openBrowser"
	| newBrowser |
	newBrowser := self new initHierarchyForClass: Object.
	^ newBrowser buildAndOpenBrowserLabel: nil
