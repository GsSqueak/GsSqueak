dependents
topView
	"Find the first top view on me. Is there any danger of their being two with the same model?  Any danger from ungarbage collected old views?  Ask if schedulled?"

	dependents ifNil: [^nil].
	dependents do: [:d| (d isWindowForModel: self) ifTrue:[^d]].
	^nil