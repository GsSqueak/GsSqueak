utilities
releaseProjectReferences: outgoingProject
	"Iterate over all project-view morphs, wherever they may be located. Also consider image segments."
	
	ImageSegment allSubInstancesDo: [:seg |
		seg ifOutPointer: outgoingProject thenAllObjectsDo: [:obj |
			(obj isKindOf: ProjectViewMorph) ifTrue: [
				obj owner isSystemWindow
					ifTrue: [obj owner model: nil; delete].
				obj abandon]]].
	
	ProjectViewMorph allSubInstancesDo: [:p | 
		p owner isSystemWindow ifTrue: [p owner model: nil; delete].
		p project == outgoingProject ifTrue: [p abandon]].