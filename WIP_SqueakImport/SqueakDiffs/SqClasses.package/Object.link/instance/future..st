futures
future: deltaMSecs
	"See FutureMaker class comment.  In practice, this code is optimized away by the Compiler (see FutureNode)."
	^(FutureMaker new)
		setDeltaMSecs: deltaMSecs target: self
