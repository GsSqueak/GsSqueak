menu actions
newProject: projectClass
	"Create a new project of the given type"
	| newProject |
	"Allow the project to return nil from #new to indicate that it was canceled."
	newProject := projectClass new ifNil:[^self].
	ProjectViewMorph openOn: newProject.
	newProject enter.