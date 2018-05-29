private
resetContentRotated: rotateFlag
	target := self class defaultTarget.
	self writeHeaderRotated: rotateFlag.
     ^self.