playing
beep

	self soundEnabled ifFalse: [^ self].

	self defaultOrNil ifNotNil: [:soundSystem | soundSystem beep].