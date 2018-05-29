*Tools-Debugger
shouldFollowOutboundPointers
	"Allow other subclasses of ProtoObject to hook this method."
	(self class isPointers or: [ self isCompiledCode ]) ifFalse: [ ^ false ].
	^ (self class isWeak not or: [ self class instSize > 0 ]) and: [ self isLiteral not ]