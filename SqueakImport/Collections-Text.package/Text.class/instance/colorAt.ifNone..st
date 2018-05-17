emphasis
colorAt: characterIndex ifNone: block

	self size = 0 ifTrue: [^ block value]. "null text tolerates access."

	^ (runs at: characterIndex)
		detect: [:attr | attr class == TextColor]
		ifFound: [:attr | attr color]
		ifNone: block