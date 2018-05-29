drawing-support
preserveStateDuring: aBlock
	^target preserveStateDuring: [ :innerTarget |
		| retval saveClip saveTransform |
		saveClip := clipRect.
		saveTransform := currentTransformation.
		gstateStack addLast: currentFont.
		gstateStack addLast: currentColor.
		gstateStack addLast: shadowColor.
		retval := aBlock value: self.
		shadowColor := gstateStack removeLast.
		currentColor := gstateStack removeLast.
		currentFont := gstateStack removeLast.
		clipRect := saveClip.
		currentTransformation := saveTransform.
		retval
	].