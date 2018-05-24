query
allBehaviors

	^Generator on: [ :generator |
		self allBehaviorsDo: [ :each |
			generator yield: each ] ]