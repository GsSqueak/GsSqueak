file in/out
objectForDataStream: refStrm
	
	self primitive = 117 ifTrue: [self literals first at: 4 put: 0].
