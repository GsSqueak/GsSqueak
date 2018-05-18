utilities
findProjectView: projectDescription
	"In this world, find the morph that holds onto the project described by projectDescription.
	projectDescription can be a project, or the name of a project.  The project may be
	represented by a DiskProxy. The holder morph may be at any depth in the world.."

	| pName |
	pName := (projectDescription isString) 
		ifTrue: [projectDescription]
		ifFalse: [projectDescription name].
	world allMorphsDo: [:pvm | | dpName |
	pvm class == ProjectViewMorph ifTrue: [
		(pvm project class == Project and: 
			[pvm project name = pName]) ifTrue: [^ pvm].
			pvm project class == DiskProxy ifTrue: [ 
			dpName := pvm project constructorArgs first.
			dpName := (dpName findTokens: '/') last.
			dpName := (Project parseProjectFileName: dpName unescapePercents) first.
			dpName = pName ifTrue: [^ pvm]]]].
	^ nil