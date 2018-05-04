initialisation
forConfiguration: spec

	^(self forPlatform: (spec at: 5)) loadConfiguration: spec
