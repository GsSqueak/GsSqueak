accessing state
point3Get
	^ self cCoerce: workBuffer + GWPoint3 to: 'int *'