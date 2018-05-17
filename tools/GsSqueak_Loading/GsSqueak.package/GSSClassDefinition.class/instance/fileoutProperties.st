fileout
fileoutProperties

	self deleteFileNamed: 'properties.json'.
	self save: 'properties.json' contents: self propertiesJson.