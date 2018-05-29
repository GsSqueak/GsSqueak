instance creation
initializedInstance
	self isAbstract ifTrue: [^nil].
	^ self new
