event handling
mouseDown: evt
	
	
	imagePopupMorph center: (self localPointToGlobal: evt position).
	imagePopupMorph bounds: (imagePopupMorph bounds translatedAndSquishedToBeWithin: self world bounds).
	imagePopupMorph openInWorld
