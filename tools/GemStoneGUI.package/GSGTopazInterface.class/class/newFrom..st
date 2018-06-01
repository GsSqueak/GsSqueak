instance creation
newFrom: sessionDescription

	sessionDescription isValid ifFalse: [^ nil].
	[^ self
		forStone: sessionDescription stoneName
		inPath: sessionDescription devkitPath
		username: sessionDescription username
		password: sessionDescription password]
			on: Error
			do: [self notify: 'Login failed'].
	^ nil