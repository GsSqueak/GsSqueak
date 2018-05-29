futures
future
	"See FutureMaker class comment.  In practice, this code is optimized away by the Compiler (see FutureNode)."
	^(FutureMaker new) 
		setDeltaMSecs: 0.0 target: self
