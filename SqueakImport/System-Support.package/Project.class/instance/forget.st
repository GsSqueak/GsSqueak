release
forget

	self isCurrentProject
		ifTrue: [^ Error signal: 'Cannot forget the current project.'].

	self class forget: self.