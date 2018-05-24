name lookup
bindingOf: varName
	"Answer the binding of some variable resolved in the scope of the receiver"
	| aSymbol binding |
	aSymbol := varName asSymbol.

	"First look in classVar dictionary."
	binding := self classPool bindingOf: aSymbol.
	binding ifNotNil:[^binding].

	"Next look in shared pools."
	self sharedPools do:[:pool | 
		| poolBinding |
		poolBinding := pool bindingOf: aSymbol.
		poolBinding ifNotNil:[^poolBinding].
	].

	"subclassing and environment are not preserved"
	^nil