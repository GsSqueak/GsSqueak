accessing state
point2Get
	^ self cCoerce: workBuffer + GWPoint2 to: 'int *'