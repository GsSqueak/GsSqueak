preferences
balloonColor: aColor

	self flag: #remove. "mt: We should remove this additional setter in the future and use UI themes instead:"
	UserInterfaceTheme current set: #color for: #BalloonMorph to: aColor.