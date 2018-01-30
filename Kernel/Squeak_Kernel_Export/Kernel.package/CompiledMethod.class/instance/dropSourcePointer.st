source code management
dropSourcePointer
	self trailer hasSourcePointer ifTrue: [
		self becomeForward: 
			(self copyWithTrailerBytes: 
				(CompiledMethodTrailer new sourceCode: self getSource))]
