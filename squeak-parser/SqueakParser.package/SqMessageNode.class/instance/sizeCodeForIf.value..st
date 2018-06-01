code generation
sizeCodeForIf: encoder value: forValue 
	| thenExpr elseExpr branchSize thenSize elseSize popSize requireTwoArms |
	thenExpr := arguments at: 1.
	elseExpr := arguments at: 2.
	popSize := 0.
	requireTwoArms := forValue
				or: ["Code all forValue as two-armed"
					arguments
						noneSatisfy: [:expr | expr isJust: NodeNil]].
	requireTwoArms
		ifTrue: [elseSize := elseExpr sizeCodeForEvaluatedValue: encoder.
			thenSize := (thenExpr sizeCodeForEvaluatedValue: encoder)
						+ (thenExpr returns
								ifTrue: ["Elide jump over else after a return"
									0]
								ifFalse: [self sizeCode: encoder forJump: elseSize]).
			branchSize := self
						sizeCode: encoder
						forBranchOn: false
						dist: thenSize.
			"Two-armed IFs forEffect share a single pop - except if both
			branches return"
			forValue
				ifFalse: [(arguments allSatisfy: #returns)
						ifFalse: [popSize := encoder sizePop]]]
		ifFalse: ["One arm is empty here (two-arms code forValue)"
			(elseExpr isJust: NodeNil)
				ifTrue: [elseSize := 0.
					thenSize := thenExpr sizeCodeForEvaluatedEffect: encoder.
					branchSize := self
								sizeCode: encoder
								forBranchOn: false
								dist: thenSize]
				ifFalse: [thenSize := 0.
					elseSize := elseExpr sizeCodeForEvaluatedEffect: encoder.
					branchSize := self
								sizeCode: encoder
								forBranchOn: true
								dist: elseSize]].
	sizes := Array with: thenSize with: elseSize.
	^ (receiver sizeCodeForValue: encoder)
		+ branchSize + thenSize + elseSize + popSize