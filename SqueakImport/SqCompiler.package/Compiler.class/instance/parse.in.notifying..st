public access
parse: textOrStream in: aClass notifying: req
	"Compile the argument, textOrStream, with respect to the class, aClass, and
	 answer the MethodNode that is the root of the resulting parse tree.  Notify the
	 argument, req, if an error occurs. The failBlock is defaulted to an empty block."

	self from: textOrStream class: aClass notifying: req.
	^self parser _envo
		parseCue: cue
		noPattern: false
		ifFail: []
