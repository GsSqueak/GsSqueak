accessing state
colorTransform
	^ self cCoerce: workBuffer + GWColorTransform to: 'float *'