utility
balloonFont

	self flag: #remove. "mt: We should remove this additional getter  in the future and use UI themes instead:"
	^ (UserInterfaceTheme current get: #font for: #BalloonMorph) ifNil: [TextStyle defaultFont]