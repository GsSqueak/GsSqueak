accessing
encodingName
	(super encodingName) ifNil: [ ^SuperSwikiServer defaultEncodingName ] ifNotNil: [^super encodingName].