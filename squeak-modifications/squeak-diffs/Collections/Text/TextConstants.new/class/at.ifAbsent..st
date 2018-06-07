accessing
at: key ifAbsent: aBlock 
	^ self classPool at: key ifAbsent: aBlock  
