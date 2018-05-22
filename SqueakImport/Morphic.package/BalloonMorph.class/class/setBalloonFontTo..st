utility
setBalloonFontTo: aFont

	self flag: #remove. "mt: We should remove this additional setter in the future and use UI themes instead:"
	UserInterfaceTheme current set: #font for: #BalloonMorph to: aFont.