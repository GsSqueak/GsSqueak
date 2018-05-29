parsing
privateInitializeFromText: aString
	schemeName := Url schemeNameForString: aString.
	schemeName ifNil: [ self error: 'opaque URL with no scheme--shouldn''t happen!'. ].
	locator := aString copyFrom: (schemeName size+2) to: aString size.