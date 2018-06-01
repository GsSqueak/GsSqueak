-Tools
open
	^ (Smalltalk
		at: #Workspace
		ifAbsent: [self]) new openLabel: 'Workspace'