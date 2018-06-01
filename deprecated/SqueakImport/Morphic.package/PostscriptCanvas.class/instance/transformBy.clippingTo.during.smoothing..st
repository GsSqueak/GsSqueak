drawing-support
transformBy: aDisplayTransform clippingTo: aClipRect during: aBlock smoothing: cellSize 
	| retval oldShadow |
	oldShadow := shadowColor.
	self comment: 'drawing clipped ' with: aClipRect.
	self comment: 'drawing transformed ' with: aDisplayTransform.
	retval := self
		preserveStateDuring: [:inner | 
			currentTransformation
				ifNil: [currentTransformation := aDisplayTransform]
				ifNotNil: [currentTransformation := currentTransformation composedWithLocal: aDisplayTransform].
			aClipRect
				ifNotNil: [clipRect := aDisplayTransform
								globalBoundsToLocal: (clipRect intersect: aClipRect).
					inner rect: aClipRect;
						 clip].
			inner transformBy: aDisplayTransform.
			aBlock value: inner].
	self comment: 'end of drawing clipped ' with: aClipRect.
	shadowColor := oldShadow.
	^ retval