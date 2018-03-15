initialize-release
username: username password: password

	| result |
	self setUsername: username.
	self setPassword: password.
	result := self login.
	(result at: 2) ifNotEmpty: [:errorMessage | 
		self terminate.
		self error: errorMessage]