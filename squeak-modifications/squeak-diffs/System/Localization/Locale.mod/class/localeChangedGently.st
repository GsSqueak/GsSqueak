notification
localeChangedGently
	SystemNavigation default allBehaviorsDo: [:b | b == self ifFalse: [b localeChangedGently]].