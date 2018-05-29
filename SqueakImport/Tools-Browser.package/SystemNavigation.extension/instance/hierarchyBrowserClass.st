*tools-browser
hierarchyBrowserClass
	hierarchyBrowserClass ifNil: [hierarchyBrowserClass := self defaultHierarchyBrowserClass].
	^hierarchyBrowserClass