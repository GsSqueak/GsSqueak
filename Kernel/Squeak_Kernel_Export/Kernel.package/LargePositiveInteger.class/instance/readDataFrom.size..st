objects from disk
readDataFrom: aDataStream size: varsOnDisk
	^(super readDataFrom: aDataStream size: varsOnDisk) normalize
	