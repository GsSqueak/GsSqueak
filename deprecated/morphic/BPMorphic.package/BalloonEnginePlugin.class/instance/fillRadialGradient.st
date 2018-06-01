fills-gradient
fillRadialGradient
	^ self
		fillRadialGradient: self lastExportedFillGet
		from: self lastExportedLeftXGet
		to: self lastExportedRightXGet
		at: self currentYGet