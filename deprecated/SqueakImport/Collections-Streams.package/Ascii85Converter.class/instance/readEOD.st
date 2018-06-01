private
readEOD

	self stringStream skipSeparators.
	self stringStream peek = $~ ifFalse: [^ false] ifTrue:
		[self stringStream next. "ignore"
		self stringStream peek = $> ifFalse: [^ false] ifTrue:
			[self stringStream next "ignore"]].
	^ true