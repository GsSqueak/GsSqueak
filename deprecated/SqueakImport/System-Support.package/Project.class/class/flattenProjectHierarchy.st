utilities
flattenProjectHierarchy
	"Clean-up project hierarchy. Make all projects be sub-projects of the top project."
	
	self allSubInstancesDo: [:ea | ea setParent: self topProject].