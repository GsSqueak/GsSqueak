writing
writeTo: aStream 
	self openStreamWhile:
		[ self rewindData.
		writeLocalHeaderRelativeOffset := aStream position.
		self
			 writeLocalFileHeaderTo: aStream ;
			 writeDataTo: aStream ;
			 refreshLocalFileHeaderTo: aStream ]