frame access
methodHeaderIndicatesLargeFrame: methodHeader 
	^ (methodHeader bitAnd: LargeContextBit)
		~= 0