enumeration
detect: block

	self do: [:command |
		(block value: command) ifTrue: [^ command]].
	^ nil