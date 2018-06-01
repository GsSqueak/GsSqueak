accessing state
edgeTransform
	^ self cCoerce: workBuffer + GWEdgeTransform to: 'float *'