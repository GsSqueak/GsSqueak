accessing state
point4Get
	^ self cCoerce: workBuffer + GWPoint4 to: 'int *'