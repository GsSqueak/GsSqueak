loading
loadOverlayClassesFrom: aFileDirectory

	aFileDirectory entriesDo: [:entry |
		entry isDirectory ifTrue: [
			(self isClassDirectoryExtension: entry extension)
				ifTrue: [	self loadOverlayClassFrom: entry asFileDirectory]
				ifFalse: [self loadOverlayClassesFrom: entry asFileDirectory]]]