message list
messageIconAt: anIndex

	self class showMessageIcons ifFalse: [^ nil].
	^ self messageIconFor: (self messageList at: anIndex ifAbsent: [^nil])