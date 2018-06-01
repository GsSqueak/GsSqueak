release
deletingProject: outgoingProject
	"Clear my previousProject link if it points at the given Project, which is being deleted."

	parentProject == outgoingProject
		ifTrue: [parentProject := parentProject parent].
	
	previousProject == outgoingProject
		ifTrue: [previousProject := previousProject previousProject].
	previousProject == outgoingProject
		ifTrue: [previousProject := nil].
	
	nextProject == outgoingProject
		ifTrue: [nextProject := nextProject nextProject].
	nextProject == outgoingProject
		ifTrue: [nextProject := nil].