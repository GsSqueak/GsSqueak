instance management
instances

	^ self instanceDict keys select: [:repository | repository class = self]