actions
normalize
	self children size = 1
		ifTrue: [| pseudoChild |
			pseudoChild := self children removeFirst.
			(self filename notNil
					and: [pseudoChild filename ~= self filename])
				ifTrue: [self error: 'Inconsistent state'].
			self filename: pseudoChild filename]