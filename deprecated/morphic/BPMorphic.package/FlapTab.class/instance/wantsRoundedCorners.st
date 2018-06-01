rounding
wantsRoundedCorners
	^ self isCurrentlyTextual
		or: [super wantsRoundedCorners]