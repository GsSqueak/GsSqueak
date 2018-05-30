multi-window support
saveMultiWindowState
	^Message
		selector: #restoreToCategory:className:protocol:selector:mode:meta:
		arguments: {	self selectedSystemCategory.
						self selectedClassName.
						self selectedMessageCategoryName.
						self selectedMessageName.
						self editSelection.
						self metaClassIndicated }