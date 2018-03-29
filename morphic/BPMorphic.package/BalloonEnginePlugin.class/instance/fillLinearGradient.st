fills-gradient
fillLinearGradient
	^ self
		fillLinearGradient: self lastExportedFillGet
		from: self lastExportedLeftXGet
		to: self lastExportedRightXGet
		at: self currentYGet