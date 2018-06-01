sub-projects & hierarchy
liftSubProjects
	"Lift my sub-projects to my parent project."
	
	self parent ifNil: [^ Error signal: 'Cannot lift sub-project because I have to parent.'].
	
	self subProjects do: [:ea | self parent addProject: ea].