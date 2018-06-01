toolbuilder
setupIfNotInitialisedYet
	"HierarchyBrowser needs some initialisation to work in the ToolBuilder>build: world since there has to be a list of classes ready to be listed. As a default we use the full Object class tree"
	classDisplayList ifNil:[ self initHierarchyForClass: Object]