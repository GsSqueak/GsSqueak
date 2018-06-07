shrinking
removeProjectsFromSystem
	"Remove all projects of this kind from the system, reorganizing the project hierarchy as needed.
	This method was originally implemented as SmalltalkImage>>zapMVCProjects in earlier
	versions of Squeak."

	"MVCProject removeProjectsFromSystem"
	"MorphicProject removeProjectsFromSystem"

	| projectsToRemove projectsToReorganize |
	
	(Project current isKindOf: self) ifTrue: [
		"We have to enter another project to unload this project kind."
		(Project subclasses detect: [:ea | (ea includesBehavior: self) not] ifNone: [])
			ifNil: [^ Error signal: 'You have to enter another kind of project.']
			ifNotNil: [:projectClass |
				^ projectClass new
					addDeferredUIMessage: [self removeProjectsFromSystem];
					enter]].

	(Project topProject isKindOf: self) ifTrue: [
		"We have to become the top project now."
		Project current beTopProject].
		
	Smalltalk garbageCollect. "So allInstances is precise"
	projectsToRemove := OrderedCollection new.
	projectsToReorganize := OrderedCollection new.
	
	Project allSubInstancesDo: [:proj | 
		(proj isKindOf: self)
			ifTrue: [projectsToRemove add: proj]
			ifFalse: [(proj parent isKindOf: self)
				ifTrue: [projectsToReorganize add: proj]]].
			
	projectsToReorganize do: [:proj |
		"Remove views and refs."
		proj parent deletingProject: proj.
		"Add as sub-project to top project to avoid cycles and confusion. Ignore the current project."
		Project topProject addProject: proj].

	projectsToRemove do: [:proj | proj delete].