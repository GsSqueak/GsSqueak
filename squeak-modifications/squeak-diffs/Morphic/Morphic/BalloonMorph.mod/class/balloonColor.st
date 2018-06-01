preferences
balloonColor

	self flag: #remove. "mt: We should remove this additional getter  in the future and use UI themes instead:"
	^ (UserInterfaceTheme current get: #color for: #BalloonMorph) ifNil: [(TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.749)]