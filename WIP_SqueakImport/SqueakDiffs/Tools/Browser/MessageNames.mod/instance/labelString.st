initialization
labelString

	^ self searchString
		ifEmpty: ['Message Names']
		ifNotEmpty: [:s | 'Message names containing "', s asString asLowercase, '"']