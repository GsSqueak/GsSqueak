system startup
shutDown: quitting

	Project current isMorphic ifTrue: [
		Project current world submorphsDo: [:ea |
			ea removeProperty: #dropShadow]].