private
saveFields
	
	(self dependents select: [:d | d hasUnacceptedEdits]) do: [:d | d accept].