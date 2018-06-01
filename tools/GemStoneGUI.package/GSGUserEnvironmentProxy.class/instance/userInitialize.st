initialization
userInitialize

	| input |
	input := UIManager default
				request: 'Username'
				initialAnswer: 'SystemUser'.
	^ input
		ifEmpty: [false]
		ifNotEmpty: [
			self username: input.
			true]