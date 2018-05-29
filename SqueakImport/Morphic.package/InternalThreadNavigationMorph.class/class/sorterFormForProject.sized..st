sorter
sorterFormForProject: aProject sized: aSize
	"Answer a form to use in a project-sorter to represent the project."

	^ (ProjectViewMorph on: aProject) imageForm scaledToSize: aSize
