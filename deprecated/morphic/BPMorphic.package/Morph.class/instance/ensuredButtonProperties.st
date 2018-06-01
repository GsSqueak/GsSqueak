-Etoys
ensuredButtonProperties
	self hasButtonProperties
		ifFalse: [self
				buttonProperties: (ButtonProperties new visibleMorph: self)].
	^ self buttonProperties