private
endDecode

	self tupleSize  > 0 ifTrue: 
		[self incrementNumber85: (self pow85 at: self tupleSize).
		self isBinary
			ifTrue: [self writeBytes255: self number85 atMax: self tupleSize - 1]
			ifFalse: [self writeChars255: self number85 atMax: self tupleSize - 1]].
	^ self dataStream