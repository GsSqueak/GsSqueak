closure analysis
isDefinedWithinBlockExtent: anInterval 
	^ anInterval rangeIncludes: definingScope actualScope blockExtent first