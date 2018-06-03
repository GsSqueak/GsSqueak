accessing
osPassword

	^ self osUser ifNotNil: [:username |
		UIManager default requestPassword: ('Password for OS-User {1}:' format: {username})]