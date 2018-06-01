accessing
font: aTTFontDescription
	font := aTTFontDescription.
	string ifNil: [self string: aTTFontDescription fullName]
		ifNotNil: [self initializeString].