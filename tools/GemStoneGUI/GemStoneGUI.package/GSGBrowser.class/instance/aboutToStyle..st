contents
aboutToStyle: aStyler

	(self editSelection == #editMessage or: [self editSelection == #newMessage])
		ifTrue: [
			aStyler
				classOrMetaClass: self selectedClassOrMetaClass;
				parseAMethod: true].
	^ true