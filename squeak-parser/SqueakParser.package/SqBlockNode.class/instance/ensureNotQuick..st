converting
ensureNotQuick: encoder 
	"If the receiver is quick (can be generated as a Quick method,
	^self,^inst var or ^ special constant)
	make it not so. This is used to create break-pointable versions of quick
	methods. Answer if the
	receiver was quick."
	self isQuick
		ifFalse: [^ false].
	"Making statements size > 1 is sufficient to cause isQuick to answer
	false (see BlockNode>>isQuick).
	N.B. This is a no-op since statements generate via emitCodeForEffect:
	and VariableNodes have no effect."
	statements
		addFirst: (encoder encodeVariable: 'self').
	^ true