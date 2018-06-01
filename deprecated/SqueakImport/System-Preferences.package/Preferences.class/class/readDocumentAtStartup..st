standard queries
readDocumentAtStartup: aBoolean
	^ self
		setPreference: #readDocumentAtStartup
		toValue: aBoolean