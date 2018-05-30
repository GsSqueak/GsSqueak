private
mouseDownInDimissHandle: evt with: dismissHandle
	evt hand obtainHalo: self.
	SoundService soundEnabled ifTrue: [TrashCanMorph playMouseEnterSound].
	self removeAllHandlesBut: dismissHandle.
	self setColor: Color darkGray toHandle: dismissHandle.
