accessing state
point1Get
	^ self cCoerce: workBuffer + GWPoint1 to: 'int *'