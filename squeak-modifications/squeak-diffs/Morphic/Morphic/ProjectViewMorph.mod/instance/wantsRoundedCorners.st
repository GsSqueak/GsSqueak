rounding
wantsRoundedCorners
	^SystemWindow roundedWindowCorners 
		and: [(owner isSystemWindow) not]