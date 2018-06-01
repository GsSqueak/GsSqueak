for real
fileNames

	^self entries select:[:each| each isDirectory not] thenCollect: [ :each | each name]