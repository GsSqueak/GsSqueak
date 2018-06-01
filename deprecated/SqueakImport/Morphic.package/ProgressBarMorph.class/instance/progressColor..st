accessing
progressColor: aColor
	progressColor = aColor
		ifFalse:
			[progressColor := aColor.
			self changed]