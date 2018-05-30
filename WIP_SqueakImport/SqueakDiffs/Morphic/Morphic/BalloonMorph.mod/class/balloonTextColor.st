preferences
balloonTextColor

	self flag: #remove. "mt: We should remove this additional getter  in the future and use UI themes instead:"
	^ (UserInterfaceTheme current get: #textColor for: #BalloonMorph) ifNil: [Color black]