code generation
emitCodeForIf: stack encoder: encoder value: forValue 
	| thenExpr thenSize elseExpr elseSize |
	thenSize := sizes at: 1.
	elseSize := sizes at: 2.
	thenExpr := arguments at: 1.
	elseExpr := arguments at: 2.
	receiver emitCodeForValue: stack encoder: encoder.
	elseSize * thenSize > 0
		ifTrue: ["Code for two-armed"
			self
				emitCodeForBranchOn: false
				dist: thenSize
				pop: stack
				encoder: encoder.
			pc := encoder methodStreamPosition.
			thenExpr emitCodeForEvaluatedValue: stack encoder: encoder.
			stack pop: 1.
			"then and else alternate; they don't accumulate"
			thenExpr returns
				ifFalse: ["Elide jump over else after a return"
					self emitCodeForJump: elseSize encoder: encoder].
			elseExpr emitCodeForEvaluatedValue: stack encoder: encoder.
			forValue
				ifFalse: ["Two-armed IFs forEffect share a single pop - except if
					both return"
					(arguments allSatisfy: #returns)
						ifFalse: [encoder genPop].
					stack pop: 1]]
		ifFalse: ["One arm is empty here (this can only ever be for effect)"
			thenSize > 0
				ifTrue: [self
						emitCodeForBranchOn: false
						dist: thenSize
						pop: stack
						encoder: encoder.
					pc := encoder methodStreamPosition.
					thenExpr emitCodeForEvaluatedEffect: stack encoder: encoder]
				ifFalse: [self
						emitCodeForBranchOn: true
						dist: elseSize
						pop: stack
						encoder: encoder.
					pc := encoder methodStreamPosition.
					elseExpr emitCodeForEvaluatedEffect: stack encoder: encoder]]