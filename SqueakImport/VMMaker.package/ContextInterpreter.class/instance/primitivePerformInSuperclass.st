control primitives
primitivePerformInSuperclass
	| lookupClass rcvr currentClass |
	lookupClass := self stackTop.
	rcvr := self stackValue: 3.
	currentClass := objectMemory fetchClassOf: rcvr.
	[currentClass ~= lookupClass]
		whileTrue:
		[currentClass := self superclassOf: currentClass.
		currentClass = objectMemory getNilObj ifTrue: [^self primitiveFailFor: PrimErrBadArgument]].

	argumentCount = 3
		ifTrue: ["normal primitive call with 3 arguments expected on the stack"
			self popStack.
			self primitivePerformAt: lookupClass.
			self successful ifFalse:
				[self push: lookupClass]]
		ifFalse: [argumentCount = 4
			ifTrue: ["mirror primitive call with extra argument specifying object to serve as receiver"
				| s1 s2 s3 s4 s5 |
				"save stack contents"
				s1 := self popStack. "lookupClass"
				s2 := self popStack. "args"
				s3 := self popStack. "selector"
				s4 := self popStack. "mirror receiver"
				s5 := self popStack. "actual receiver"
				"slide stack up one, omitting the actual receiver parameter"
				self push: s4. "mirror receiver"
				self push: s3. "selector"
				self push: s2. "args"
				"perform as if mirror receiver had been the actual receiver"
				self primitivePerformAt: lookupClass.
				self successful ifFalse:
					["restore original stack"
					self pop: 3. "args, selector, mirror receiver"
					self push: s5. "actual receiver"
					self push: s4. "mirror receiver"				
					self push: s3. "selector"
					self push: s2. "args"
					self push: s1. "lookup class" ]]
			ifFalse: ["wrong number of arguments"
				^self primitiveFailFor: PrimErrBadNumArgs]]
