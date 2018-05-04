object memory support
markAndTraceAndMaybeFreeStackPages: fullGCFlag
	"Read markAndTraceStackPages:'s comment.  Finish tracing to-be-traced pages.
	 Then free any untraced pages."
	| thePage foundToBeTracedPage |
	<var: #thePage type: #'StackPage *'>
	<inline: false>
	fullGCFlag ifFalse:
		[0 to: numStackPages - 1 do:
			[:i|
			thePage := stackPages stackPageAt: i.
			self assert: (thePage setTrace: -1) ~= 0]. "Invalidate the trace state for assertion checks"
		^nil].
	[foundToBeTracedPage := false.
	0 to: numStackPages - 1 do:
		[:i|
		thePage := stackPages stackPageAt: i.
		((stackPages isFree: thePage) not
		 and: [thePage trace = 1]) ifTrue:
			[foundToBeTracedPage := true.
			 thePage setTrace: 2.
			 self markAndTraceStackPage: thePage]].
	foundToBeTracedPage] whileTrue.

	0 to: numStackPages - 1 do:
		[:i|
		thePage := stackPages stackPageAt: i.
		((stackPages isFree: thePage) not
		 and: [thePage trace = 0]) ifTrue:
			[self assert: (self noMarkedContextsOnPage: thePage).
			 stackPages freeStackPage: thePage].
		self assert: (thePage setTrace: -1) ~= 0] "Invalidate the trace state for assertion checks"