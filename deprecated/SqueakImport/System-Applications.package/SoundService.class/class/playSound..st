playing
playSound: sound

	self soundEnabled ifFalse: [^ self].

	self defaultOrNil ifNotNil: [:soundSystem |
		soundSystem playSound: sound].