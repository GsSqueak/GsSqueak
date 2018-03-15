login button
login

	| topazInterface |
	[topazInterface := GSGTopazInterface
						forStone: self stoneName
						inPath: self devkitPath
						username: self username
						password: self password.
	self openSessionManagerOn: topazInterface]
		ifError: [self notify: 'Login failed']