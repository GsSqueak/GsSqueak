initialization
initializeExtent: aPoint noSelectedThumbnail: aForm noSelectedBalloonText: aString 
	self
		image: (Form extent: aPoint).
""
	noSelectedThumbnail := aForm.
	noSelectedBalloonText := aString