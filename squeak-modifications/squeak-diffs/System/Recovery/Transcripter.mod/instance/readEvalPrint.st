command line
readEvalPrint
	| line okToRevert |
	okToRevert := true.
	[#('quit' 'exit' 'done' ) includes: (line := self request: '>')]
		whileFalse:
		[line = 'revert'
		ifTrue: [okToRevert
			ifTrue: [RecentMessages default revertMostRecent.
					self cr; show: 'reverted: ' , RecentMessages default mostRecent.
					okToRevert := false]
			ifFalse: [self cr; show: 'Only one level of revert currently supported']]
		ifFalse: [self cr; show: ([Compiler evaluate: line] ifError: [:err :ex | err])]]