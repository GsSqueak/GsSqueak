layout
layoutBounds

	^ (transform globalBoundsToLocal: super layoutBounds) truncated
