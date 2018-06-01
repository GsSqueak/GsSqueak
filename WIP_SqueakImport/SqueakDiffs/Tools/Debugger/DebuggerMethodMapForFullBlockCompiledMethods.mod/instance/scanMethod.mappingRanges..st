source mapping
scanMethod: theMethodToScan mappingRanges: rawSourceRanges
	| abstractPC scanner client maybeBlock concreteSourceRanges rangesForMethod |
	rangesForMethod := (abstractSourceRanges at: theMethodToScan put: Dictionary new).
	concreteSourceRanges := Dictionary new.
	"The rawSourceRanges map node pcs to ranges.
	 When node is one in the home method the node's pc is an integer.
	When the node is within a block method the node's pc is an association from CompiledBlock to pc.
	 Extract pc -> range for this particular CompiledMethod or CompiledBlock."
	rawSourceRanges keysAndValuesDo:
		(theMethodToScan isCompiledMethod
			ifTrue:
				[[:node :range|
				   (node pc isVariableBinding
				    or: [node pc = 0]) ifFalse:
						[concreteSourceRanges at: node pc put: range]]]
			ifFalse:
				[[:node :range|
				   (node pc isVariableBinding
				    and: [node pc key == theMethodToScan
				    and: [node pc value ~= 0]]) ifTrue:
					[concreteSourceRanges at: node pc value put: range]]]).
	abstractPC := 1.
	scanner := InstructionStream on: theMethodToScan.
	client := BlockStartLocator new.
	[(concreteSourceRanges includesKey: scanner pc) ifTrue:
		[rangesForMethod at: abstractPC put: (concreteSourceRanges at: scanner pc)].
	 abstractPC := abstractPC + 1.
	 maybeBlock := scanner interpretNextInstructionFor: client.
	 (maybeBlock ~~ client
	  and: [maybeBlock isCompiledCode]) ifTrue:
		[self assert: maybeBlock isCompiledBlock.
		 self scanMethod: maybeBlock mappingRanges: rawSourceRanges].
	 scanner atEnd] whileFalse