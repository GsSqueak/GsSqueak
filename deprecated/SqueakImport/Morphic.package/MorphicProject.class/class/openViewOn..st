instance creation
openViewOn: aPasteUpOrNil
	"Create a new Morphic Project and open a view for the project"
	| newProject |
	newProject := self new.
	aPasteUpOrNil ifNotNil: [newProject installPasteUpAsWorld: aPasteUpOrNil].
	ProjectViewMorph openOn: newProject.
	^newProject
