debug support
symbolicMethod: aMethod printAbsPC: printAbsPC
	<doNotGenerate>
	| pc end latestContinuation prim stackDepth stackDepths |
	self transcript ensureCr.
	(prim := self primitiveIndexOf: aMethod) > 0 ifTrue:
		[self transcript nextPutAll: '<primitive: '; print: prim; nextPut: $>.
		(self isQuickPrimitiveIndex: prim) ifTrue:
			[self transcript nextPutAll: ' quick method'; cr; flush.
			 ^self].
		self transcript cr].
	stackDepth := self tempCountOf: aMethod.
	stackDepths := [self debugStackPointersFor: aMethod]
						on: Error
						do: [:ex| nil].
	pc := latestContinuation := self startPCOfMethod: aMethod.
	end := objectMemory byteSizeOf: aMethod.
	[pc <= end] whileTrue:
		[| byte byte2 byte3 byte4 type offset jumpTarget |
		 byte := objectMemory fetchByte: pc ofObject: aMethod.
		 type := byte // 16.
		 offset := byte \\ 16.  
		 (byte >= 120 and: [byte <= 125 and: [pc >= latestContinuation]]) ifTrue:"Return bytecodes (possible lastPC here)"
			[end := pc].
		 (type = 8 and: [offset = 15]) ifTrue: "closure creation; update latest continuation"
			[byte3 := objectMemory fetchByte: pc + 2 ofObject: aMethod.
			 byte4 := objectMemory fetchByte: pc + 3 ofObject: aMethod.
			 jumpTarget := (byte3 * 256) + byte4 + pc + 4.
			 jumpTarget > latestContinuation ifTrue: [latestContinuation := jumpTarget]].
		 type=9 ifTrue: "Short jumps (need to update latest continuation"
			[jumpTarget := (offset < 8 ifTrue: [offset] ifFalse: [offset - 8]) + pc + 2.
			jumpTarget > latestContinuation ifTrue: [latestContinuation := jumpTarget]].
		 type=10 ifTrue: "Long jumps (need to update latest continuation)"
			[byte2 := objectMemory fetchByte: pc + 1 ofObject: aMethod.
			 jumpTarget := (offset < 8 ifTrue: [offset - 4] ifFalse: [offset bitAnd: 3]) * 256 + byte2 + pc + 2.
			 jumpTarget > latestContinuation ifTrue: [latestContinuation := jumpTarget]].

		 printAbsPC ifTrue:
			[(objectMemory firstIndexableField: aMethod) + pc printOn: self transcript base: 16.
			 self transcript space].
		 self transcript print: pc + 1 ; space.
		 byte printOn: self transcript base: 16 length: 2 padded: false.
		 self transcript space; nextPutAll: (self symbolic: byte at: pc inMethod: aMethod).
		 pc := self cppIf: NewspeakVM
					ifTrue:
						[type = 8 "extensions"
							ifTrue: [pc + (#(2 2 2 2 3 2 2 1 1 1 2 2 3 3 3 4) at: byte \\ 16 + 1)]
							ifFalse:
								[type = 10 "long jumps"
									ifTrue: [pc + 2]
									ifFalse:
										[type = 7
											ifTrue: [pc + (#(1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 2) at: byte \\ 16 + 1)]
											ifFalse: [pc + 1]]]]
					ifFalse:
						[type = 8 "extensions"
							ifTrue: [pc + (#(2 2 2 2 3 2 2 1 1 1 2 1 3 3 3 4) at: byte \\ 16 + 1)]
							ifFalse: [type = 10 "long jumps"
										ifTrue: [pc + 2]
										ifFalse: [pc + 1]]].
		 stackDepths notNil ifTrue:
			[self transcript tab; tab; nextPut: $(; print: stackDepth.
			 (byte ~= 144 and: [pc <= end and: [stackDepth ~= (stackDepths at: pc)]]) ifTrue:
				[self transcript nextPutAll: '->'; print: (stackDepth := stackDepths at: pc)].
			 self transcript nextPut: $)].
		 self transcript cr; flush]