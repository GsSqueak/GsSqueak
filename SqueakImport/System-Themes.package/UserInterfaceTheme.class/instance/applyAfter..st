actions
applyAfter: block

	ignoreApply := true.
	lastScaleFactor := RealEstateAgent scaleFactor.
	^ block ensure: [ignoreApply := false. self apply]