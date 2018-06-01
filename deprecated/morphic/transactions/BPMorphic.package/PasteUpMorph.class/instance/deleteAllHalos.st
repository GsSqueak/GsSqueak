world state
deleteAllHalos
	self haloMorphs
		do: [:m | m target isSelectionMorph
				ifTrue: [m target delete]].
	self hands
		do: [:each | each removeHalo]