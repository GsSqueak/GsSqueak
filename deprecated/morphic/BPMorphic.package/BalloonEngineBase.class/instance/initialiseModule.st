initialize-release
initialiseModule
	loadBBFn := interpreterProxy ioLoadFunction: 'loadBitBltFrom' From: bbPluginName.
	copyBitsFn := interpreterProxy ioLoadFunction: 'copyBitsFromtoat' From: bbPluginName.
	^ loadBBFn ~= 0
		and: [copyBitsFn ~= 0]