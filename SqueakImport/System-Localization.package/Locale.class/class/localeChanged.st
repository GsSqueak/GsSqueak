notification
localeChanged
	SystemNavigation default allBehaviorsDo: [:b |
		b == self ifFalse: [b localeChanged]].