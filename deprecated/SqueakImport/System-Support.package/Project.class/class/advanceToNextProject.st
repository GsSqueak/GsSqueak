utilities
advanceToNextProject
	| nextProj |
	(nextProj := CurrentProject nextProject) ifNotNil:
		 [nextProj enter: true revert: false saveForRevert: false]
