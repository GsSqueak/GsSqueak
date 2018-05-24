release
delete

	self isCurrentProject
		ifTrue: [^ Error signal: 'Cannot delete the current project.'].

	self removeChangeSetIfPossible.

	ProjectHistory forget: self.
	Project deletingProject: self.