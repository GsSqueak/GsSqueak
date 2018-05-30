instance creations
removeDescriptionNamed: descriptionName subfamilyName: subfamilyName

	| tts |
	Descriptions ifNil: [^ self].
	tts := Descriptions select: [:f | f first name = descriptionName and: [f first subfamilyName = subfamilyName]].
	tts do: [:f | Descriptions remove: f].
