release
deletingProject: outgoingProject

	(self world submorphs
		select: [:m | m isSystemWindow and: [m model == outgoingProject]]
		thenCollect: [:window | window paneMorphs first])
		do: [:projectViewMorph |
			projectViewMorph owner "window" model: nil; delete.
			projectViewMorph abandon].

	super deletingProject: outgoingProject.