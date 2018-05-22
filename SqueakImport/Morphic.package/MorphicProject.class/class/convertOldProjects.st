class initialization
convertOldProjects
	"Convert older Morphic projects to be MorphicProjects"
	Project allInstancesDo:[:p|
		p isMorphic ifTrue:[p primitiveChangeClassTo: self basicNew].
	].