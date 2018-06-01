client services
memberNamed: aString
	^(zip member: aString)
		ifNil: [ | matching |
			matching := zip membersMatching: aString.
			matching isEmpty ifFalse: [ matching last ]].