testing
stackDepth
	| ctxt n |
	ctxt := activeContext.
	n := 0.
	[(ctxt := (objectMemory fetchPointer: SenderIndex ofObject: ctxt)) = objectMemory getNilObj]
		whileFalse: [n := n+1].
	^ n