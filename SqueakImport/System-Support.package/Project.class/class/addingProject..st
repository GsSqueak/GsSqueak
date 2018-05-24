utilities
addingProject: newProject

	(self allProjects includes: newProject) ifTrue: [^self].
	AllProjects := self allProjects copyWith: newProject.