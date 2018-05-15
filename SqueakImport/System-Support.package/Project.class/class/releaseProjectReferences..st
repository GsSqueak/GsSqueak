utilities
releaseProjectReferences: outgoingProject
	"Give all kinds of projects the chance to do generic clean-up to their best knowledge. Consider image segments first."
	
	Smalltalk garbageCollect.
		
	ImageSegment allSubInstancesDo: [:seg |
		seg ifOutPointer: outgoingProject thenAllObjectsDo: [:obj |
			(obj isKindOf: Project) ifTrue: [obj deletingProject: outgoingProject]]].
	
	self allSubclassesDo: [:projectClass |
		(projectClass selectors includes: #releaseProjectReferences:)
			ifTrue: [projectClass releaseProjectReferences: outgoingProject]].