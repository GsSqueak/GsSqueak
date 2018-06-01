initialization
applyModelExtent
	| initialExtent |
	initialExtent := Preferences bigDisplay
				ifTrue: [(model initialExtent * 1.5) rounded]
				ifFalse: [model initialExtent].
	self extent: initialExtent 