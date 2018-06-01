-widgets
frameOffsets
	self layoutFrame
		ifNil: [^ 0 @ 0 corner: 0 @ 0].
	^ (self layoutFrame leftOffset
		ifNil: [0])
		@ (self layoutFrame topOffset
				ifNil: [0]) corner: (self layoutFrame rightOffset
			ifNil: [0])
			@ (self layoutFrame bottomOffset
					ifNil: [0])