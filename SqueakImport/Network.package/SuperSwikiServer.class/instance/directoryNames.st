for real
directoryNames

	^self entries select:[:each| each isDirectory] thenCollect: [ :each | each name]