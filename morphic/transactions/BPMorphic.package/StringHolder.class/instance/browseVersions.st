-Tools
browseVersions
	"Create and schedule a Versions Browser, showing all versions of the 
	currently selected message. Answer the browser or nil."
	^ self classCommentIndicated
		ifTrue: [ClassCommentVersionsBrowser browseCommentOf: self selectedClass]
		ifFalse: [self selectedMessageName
				ifNotNil: [:selector | ToolSet browseVersionsOf: self selectedClassOrMetaClass selector: selector]]