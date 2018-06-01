private
skipCComments
	[ stream skipSeparators.
	stream peekFor: $/ ] whileTrue: [
		stream next.		"skip next *"
		[ (stream skipTo: $*) ifFalse: [ ^false ].
			stream peekFor: $/ ] whileFalse ]