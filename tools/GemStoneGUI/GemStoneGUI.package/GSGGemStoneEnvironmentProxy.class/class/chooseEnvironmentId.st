instance creation
chooseEnvironmentId

	| envString envId |
	envString := UIManager default
					request: 'Environment Id (between 0 and 255)'
					initialAnswer: '0'.
	^ envString
		ifEmpty: [nil]
		ifNotEmpty: [
			[envId := Integer readFrom: envString]
				on: Error
				do: [^ nil].
			(envId < 0 or: [envId > 255])
				ifTrue: [nil]
				ifFalse: [envId]]