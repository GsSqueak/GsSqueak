multi-window support
saveMultiWindowState
	^Message
		selector: #restoreToPackage:category:className:protocol:selector:mode:meta:
		arguments: {	self package.
						self selectedSystemCategory.
						self selectedClassName.
						self selectedMessageCategoryName.
						self selectedMessageName.
						self editSelection.
						self metaClassIndicated }