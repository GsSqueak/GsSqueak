error handling
fail
	| exitBlock |
	(encoder == nil
			or: [encoder == self])
		ifFalse: [encoder release.
			encoder := nil].
	"break cycle"
	exitBlock := failBlock.
	failBlock := nil.
	^ exitBlock value