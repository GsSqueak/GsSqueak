utilities
returnToPreviousProject
	"Return to the project from which this project was entered. Do nothing if the current project has no link to its previous project."

	| prevProj |
	prevProj := CurrentProject previousProject.
	prevProj ifNotNil: [prevProj enter: true revert: false saveForRevert: false].
