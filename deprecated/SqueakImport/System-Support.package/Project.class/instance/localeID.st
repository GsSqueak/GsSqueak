language
localeID
	"Answer the natural language for the project"

	
	^ self projectParameterAt: #localeID
		ifAbsentPut: [ | prev |
			(prev := self previousProject)
				ifNotNil: [prev projectParameterAt: #localeID ifAbsent: [LocaleID current]]
				ifNil: [LocaleID current]]