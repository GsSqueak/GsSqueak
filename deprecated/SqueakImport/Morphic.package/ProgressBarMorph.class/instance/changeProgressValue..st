menu
changeProgressValue: evt
	| answer |
	answer := UIManager default
		request: 'Enter new value (0 - 1.0)'
		initialAnswer: self value contents asString.
	answer isEmptyOrNil ifTrue: [^ self].
	self value contents: answer asNumber