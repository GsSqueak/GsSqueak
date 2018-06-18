installing
installInto: anEnvironment

	self isLinked
		ifTrue: [ ^ self linkedInstallInto: anEnvironment ]
		ifFalse: [ ^ self nonLinkedInstallInto: anEnvironment ]
