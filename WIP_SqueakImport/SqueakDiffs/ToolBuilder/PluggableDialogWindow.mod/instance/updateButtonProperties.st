updating
updateButtonProperties

	self buttons do: [:ea |
		ea setProperty: #normalColor toValue: ea offColor.
		ea setProperty: #normalLabel toValue: ea label.
		ea hResizing: #rigid; vResizing: #rigid].
	
	self updateButtonExtent.