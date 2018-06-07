sub-projects & hierarchy
beTopProject

	self isTopProject ifTrue: [^ self].
	
	self parent deletingProject: self. "Just remove views and refs to me."
	self addProject: self class topProject.
	self setParent: self.