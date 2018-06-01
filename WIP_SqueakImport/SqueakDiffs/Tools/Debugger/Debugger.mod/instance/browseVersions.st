context stack menu
browseVersions
	"Create and schedule a message set browser on all versions of the currently selected message selector."
	(ToolSet
		browseVersionsOf: self selectedClassOrMetaClass
		selector: self selectedMessageName) ifNil: [self changed: #flash]