building
autoSelectString: aString

	super autoSelectString: aString.
	autoSelectStrings := messageList collect: [ :each | aString ]
