accessing
selectedEnvironment
	"Answer the name of the selected package or nil."

	self hasPackageSelected ifFalse: [^nil].
	^ Smalltalk globals