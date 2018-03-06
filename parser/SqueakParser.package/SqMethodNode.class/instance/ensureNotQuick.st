converting
ensureNotQuick
	"If the receiver is quick (can be generated as a Quick method,
	^self,^inst var or ^ special constant)
	make it not so. This is used to create break-pointable versions of quick
	methods. Answer if the
	receiver was quick."
	^ block ensureNotQuick: encoder