accessing
findProjectView: projectDescription
	"In this world, find the morph that holds onto the project described by projectDescription.
	projectDescription can be a project, or the name of a project.  The project may be
	represented by a DiskProxy.  The holder morph may be at any depth in the world.
	Need to fix this if Projects have subclasses, or if a class other than ProjectViewMorph
	can officially hold onto a project.  (Buttons, links, etc)
	If parent is an MVC world, return the ProjectController."

	self flag: #bob.		"read the comment"
	self subclassResponsibility