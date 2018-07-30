instance creation
open

	^ self getSessionDescription ifNotNil: [:sessionDescription |
		(self newFrom: sessionDescription) ifNotNil: [:repository |
			self addInstance: repository.
			repository]]