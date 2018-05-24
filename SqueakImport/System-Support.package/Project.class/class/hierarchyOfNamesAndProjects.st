utilities
hierarchyOfNamesAndProjects
	"Answer a list of all project names, with each entry preceded  
	by white space commensurate with its depth beneath the top  
	project"
	^ self allProjectsOrdered
		select: [:project | (#('<no name -- garbage?>' 'Building with Squeak' 'Fun With Music' ) includes: project name) not]
		thenCollect: [:project | Array with: project nameAdjustedForDepth with: project]