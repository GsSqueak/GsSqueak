sista bytecodes
sistaInlinePrimitive: prim 
	"SistaV1:	248		11111000 iiiiiiii		mjjjjjjj		Call Primitive #iiiiiiii + (jjjjjjj * 256)
	m=1 means inlined primitive, no hard return after execution. This is
	the dispatch for unmapped sista inlined primitives."
	prim < 1000
		ifTrue: [^ self nullaryInlinePrimitive: prim].
	prim < 2000
		ifTrue: [^ self unaryInlinePrimitive: prim - 1000].
	prim < 3000
		ifTrue: [^ self binaryInlinePrimitive: prim - 2000].
	prim < 4000
		ifTrue: [^ self trinaryInlinePrimitive: prim - 3000].
	prim < 5000
		ifTrue: [^ self quaternaryInlinePrimitive: prim - 4000].
	prim < 6000
		ifTrue: [^ self quinaryInlinePrimitive: prim - 5000].
	prim < 7000
		ifTrue: [^ self jumpUnaryInlinePrimitive: prim - 6000].
	prim < 8000
		ifTrue: [^ self jumpBinaryInlinePrimitive: prim - 7000].
	^ self jumpTrinaryInlinePrimitive: prim - 8000