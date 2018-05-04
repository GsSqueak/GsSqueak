as yet unclassified
customizeShortCasesForDispatchVar: varName in: codeGen method: aTMethod
	"Make customized versions of a short bytecode methods, substituting a constant having the case index value for the given variable. This produces better code for short bytecodes such as instance variable pushes that encode the index of the instance variable in the bytecode."

	| newFirsts newLasts newCases l f case expanded |
	newFirsts := OrderedCollection new.
	newLasts := OrderedCollection new.
	newCases := OrderedCollection new.
	1 to: cases size do: [ :i |
		l := lasts at: i.
		f := firsts at: i.
		case := cases at: i.
		expanded := false.
		(l - f) > 1 ifTrue: [  "case code covers multiple cases"
			(case nodeCount < 60
				or: [self assumesCurrentBytecodeMatchesCaseValue: case]) ifTrue: [
					newFirsts addAll: (f to: l) asArray.
					newLasts addAll: (f to: l) asArray.
					newCases addAll: (self customizeCase: case forVar: varName from: f to: l in: codeGen method: aTMethod).
					expanded := true
			]
		].
		expanded ifFalse: [
			self processSharedCodeBlocks: case forCase: f in: codeGen method: aTMethod.
			newFirsts addLast: f.
			newLasts addLast: l.
			newCases addLast: case.
		]
	].
	firsts := newFirsts asArray.
	lasts := newLasts asArray.
	cases := newCases asArray.
