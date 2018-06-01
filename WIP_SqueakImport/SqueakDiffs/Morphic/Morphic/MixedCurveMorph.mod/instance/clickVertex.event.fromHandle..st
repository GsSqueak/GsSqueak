editing
clickVertex: ix event: evt fromHandle: handle
" Toggle the state of the clamp. "
"Note: self clamps assures slopeClamps will be same size as vertices"

(self clamps at: ix) 
	ifNil:	 [ slopeClamps  at: ix put: 0 ]
	ifNotNil: [ slopeClamps  at: ix put: nil ] .
	self setVertices: vertices .
	
