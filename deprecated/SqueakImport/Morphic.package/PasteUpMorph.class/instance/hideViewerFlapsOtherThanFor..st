misc
hideViewerFlapsOtherThanFor: aPlayer
	self flapTabs do:
		[:aTab | (aTab isKindOf: ViewerFlapTab)
			ifTrue:
				[aTab scriptedPlayer == aPlayer
					ifFalse:
						[aTab hideFlap]]]