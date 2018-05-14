changing process state
terminate 
	"Stop the process that the receiver represents forever.  Unwind to execute pending ensure:/ifCurtailed: blocks before terminating."

	| ctxt unwindBlock oldList |
	self isActiveProcess ifTrue: [
		ctxt := thisContext.
		[	ctxt := ctxt findNextUnwindContextUpTo: nil.
			ctxt isNil
		] whileFalse: [
			(ctxt tempAt: 2) ifNil:[
				ctxt tempAt: 2 put: nil.
				unwindBlock := ctxt tempAt: 1.
				thisContext terminateTo: ctxt.
				unwindBlock value].
		].
		thisContext terminateTo: nil.
		self suspend.
	] ifFalse:[
		"Always suspend the process first so it doesn't accidentally get woken up"
		oldList := self suspend.
		suspendedContext ifNotNil:[
			"Figure out if we are terminating a process that is in the ensure: block of a critical section.
			 In this case, if the block has made progress, pop the suspendedContext so that we leave the
			 ensure: block inside the critical: without signaling the semaphore/exiting the primitive section,
			 since presumably this has already happened."
			(suspendedContext isClosureContext
			 and: [(suspendedContext method pragmaAt: #criticalSection) notNil
			 and: [suspendedContext startpc > suspendedContext closure startpc]]) ifTrue:
				[suspendedContext := suspendedContext home].

			"If we are terminating a process halfways through an unwind, try
			to complete that unwind block first."
			(suspendedContext findNextUnwindContextUpTo: nil) ifNotNil:
				[:outer|
				(suspendedContext findContextSuchThat:[:c| c closure == (outer tempAt: 1)]) ifNotNil:
					[:inner| "This is an unwind block currently under evaluation"
					suspendedContext runUntilErrorOrReturnFrom: inner]].

			ctxt := self popTo: suspendedContext bottomContext.
			ctxt == suspendedContext bottomContext ifFalse:
				[self debug: ctxt title: 'Unwind error during termination'].
			"Set the context to its endPC for the benefit of isTerminated."
			ctxt pc: ctxt endPC]]