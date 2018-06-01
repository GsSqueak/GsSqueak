parts bin
inPartsBin
	self isPartsDonor
		ifTrue: [^ true].
	self
		allOwnersDo: [:m | m isPartsBin
				ifTrue: [^ true]].
	^ false