initialize-release
username: user password: password

	| result |
	self setUsername: user.
	self username: user.
	self setPassword: password.
	result := self login.
	(result at: 2) ifNotEmpty: [:errorMessage | 
		self terminate.
		self error: errorMessage].
	self initializeSession