images
importImage: anImage named: aName 
	imports
		at: (Utilities
				keyLike: aName
				satisfying: [:ea | (imports includesKey: ea) not])
		put: anImage