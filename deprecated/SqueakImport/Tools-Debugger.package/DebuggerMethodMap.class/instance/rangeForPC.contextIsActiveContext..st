private but obsolete
rangeForPC: contextsConcretePC contextIsActiveContext: contextIsActiveContext
	"Answer the indices in the source code for the supplied pc.
	 If the context is the actve context (is at the hot end of the stack)
	 then its pc is the current pc.  But if the context isn't, because it is
	 suspended sending a message, then its current pc is the previous pc."

	| pc i end |
	pc := self method abstractPCForConcretePC: (contextIsActiveContext
													ifTrue: [contextsConcretePC]
													ifFalse: [(self method pcPreviousTo: contextsConcretePC)
																ifNotNil: [:prevpc| prevpc]
																ifNil: [contextsConcretePC]]).
	(self abstractSourceMap includesKey: pc) ifTrue:
		[^self abstractSourceMap at: pc].
	sortedSourceMap ifNil:
		[sortedSourceMap := self abstractSourceMap associations
			replace: [ :each | each copy ];
			sort].
	sortedSourceMap isEmpty ifTrue: [^1 to: 0].
	i := sortedSourceMap findNearbyBinaryIndex: [:assoc| pc - assoc key].
	i < 1 ifTrue: [^1 to: 0].
	i > sortedSourceMap size ifTrue:
		[end := sortedSourceMap inject: 0 into:
			[:prev :this | prev max: this value last].
		^end+1 to: end].
	^(sortedSourceMap at: i) value

	"| method source scanner map |
	 method := DebuggerMethodMap compiledMethodAt: #rangeForPC:contextIsActiveContext:.
	 source := method getSourceFromFile asString.
	 scanner := InstructionStream on: method.
	 map := method debuggerMap.
	 Array streamContents:
		[:ranges|
		[scanner atEnd] whileFalse:
			[| range |
			 range := map rangeForPC: scanner pc contextIsActiveContext: true.
			 ((map abstractSourceMap includesKey: scanner abstractPC)
			  and: [range first ~= 0]) ifTrue:
				[ranges nextPut: (source copyFrom: range first to: range last)].
			scanner interpretNextInstructionFor: InstructionClient new]]"