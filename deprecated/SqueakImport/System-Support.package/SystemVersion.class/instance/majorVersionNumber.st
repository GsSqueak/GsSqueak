accessing
majorVersionNumber

	(version indexOf: $.) = 0 ifTrue: [^ nil].
	^ (version copyFrom: 'Squeak' size to: (version indexOf: $.)) asInteger