fills-bitmaps
fillBitmapSpan
	^ self
		fillBitmapSpan: self lastExportedFillGet
		from: self lastExportedLeftXGet
		to: self lastExportedRightXGet
		at: self currentYGet