preferences
balloonTextColor: aColor

	self flag: #remove. "mt: We should remove this additional setter in the future and use UI themes instead:"
	UserInterfaceTheme current set: #textColor for: #BalloonMorph to: aColor.