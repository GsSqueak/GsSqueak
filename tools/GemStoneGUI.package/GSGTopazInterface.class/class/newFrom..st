instance creation
newFrom: sessionDescription

	[^ self
		forStone: sessionDescription stoneName
		inPath: sessionDescription devKitPath
		username: sessionDescription userID
		password: sessionDescription password]
			on: Error
			do: [self notify: 'Login failed'].
	^ nil