utilities
deletingProject: outgoingProject
	"Delete the outgoing project and all its sub-projects. Start with the sub-projects."
	
	"Delete all sub-projects."
	outgoingProject subProjects do: [:p | self deletingProject: p].

	"Forget that it ever existed. We have to do that now to avoid other code iterating over the partially removed project."
	self forget: outgoingProject.	

	"Give all registered projects the chance to release their references."
	self allProjects do: [:p | p deletingProject: outgoingProject].
	
	"Really clean-up everything related to the outgoing project."
	self releaseProjectReferences: outgoingProject.