source mapping
rangeForPC: contextsConcretePC in: method contextIsActiveContext: contextIsActiveContext
	"Answer the indices in the source code for the supplied pc.
	 If the context is the actve context (is at the hot end of the stack)
	 then its pc is the current pc.  But if the context isn't, because it is
	 suspended sending a message, then its current pc is the previous pc."

	| pc i end mapForMethod sortedMap |
	pc := self method abstractPCForConcretePC: (contextIsActiveContext
													ifTrue: [contextsConcretePC]
													ifFalse: [(self method pcPreviousTo: contextsConcretePC)
																ifNotNil: [:prevpc| prevpc]
																ifNil: [contextsConcretePC]]).
	((mapForMethod := self abstractSourceMapForMethod: method) includesKey: pc) ifTrue:
		[^mapForMethod at: pc].
	sortedSourceMap ifNil:
		[sortedSourceMap := IdentityDictionary new].
	sortedMap := sortedSourceMap
						at: method
						ifAbsentPut: [mapForMethod associations
										replace: [ :each | each copy ];
										sort].
	sortedMap isEmpty ifTrue: [^1 to: 0].
	i := sortedMap findNearbyBinaryIndex: [:assoc| pc - assoc key].
	i < 1 ifTrue: [^1 to: 0].
	i > sortedMap size ifTrue:
		[end := sortedMap inject: 0 into:
			[:prev :this | prev max: this value last].
		^end+1 to: end].
	^(sortedMap at: i) value

	"| method source scanner map |
	 method := DebuggerMethodMapForFullBlockCompiledMethods compiledMethodAt: #rangeForPC:in:contextIsActiveContext:.
	 source := method getSourceFromFile asString.
	 scanner := InstructionStream on: method.
	 map := method debuggerMap.
	 Array streamContents:
		[:ranges|
		[scanner atEnd] whileFalse:
			[| range |
			 range := map rangeForPC: scanner pc in: method contextIsActiveContext: true.
			 ((map abstractSourceMap includesKey: scanner abstractPC)
			  and: [range first ~= 0]) ifTrue:
				[ranges nextPut: (source copyFrom: range first to: range last)].
			scanner interpretNextInstructionFor: InstructionClient new]]"