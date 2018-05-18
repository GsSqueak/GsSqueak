submorphs-add/remove
deleteSubmorphsWithProperty: aSymbol
	submorphs copy do:
		[:m | (m hasProperty: aSymbol) ifTrue: [m delete]]