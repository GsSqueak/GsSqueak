fileout
propertiesJson

	^ String streamContents: [:aStream | self properties writeCypressJsonOn: aStream]
	