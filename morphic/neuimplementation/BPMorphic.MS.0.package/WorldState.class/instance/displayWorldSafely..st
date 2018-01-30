update cycle
displayWorldSafely: aWorld 
	"Update this world's display and keep track of errors during draw
	methods. "
	| finished errors previousClasses |
	finished := false.
	errors := nil.
	[finished]
		whileFalse: [[aWorld displayWorld.
			finished := true]
				on: Error
				do: [:ex | 
					| err rcvr errCtx errMorph |
					"Handle a drawing error"
					err := ex description.
					rcvr := ex receiver.
					errCtx := thisContext.
					[errCtx := errCtx sender.
					"Search the sender chain to find the morph causing
					the problem"
					[errCtx notNil
						and: [errCtx receiver isMorph not]]
						whileTrue: [errCtx := errCtx sender].
					"If we're at the root of the context chain then we have
					a fatal drawing problem"
					errCtx
						ifNil: [^ Project current handleFatalDrawingError: err].
					errMorph := errCtx receiver.
					"If the morph causing the problem has already the
					#drawError flag set,
					then search for the next morph above in the caller
					chain. "
					errMorph hasProperty: #errorOnDraw] whileTrue.
					errMorph setProperty: #errorOnDraw toValue: true.
					"Catch all errors, one for each receiver class."
					errors
						ifNil: [errors := OrderedCollection new].
					previousClasses
						ifNil: [previousClasses := IdentitySet new].
					(previousClasses includes: rcvr class)
						ifFalse: [previousClasses add: rcvr class.
							errors add: (Process forContext: ex signalerContext copyStack priority: Processor activeProcess priority)
									-> err].
					aWorld fullRepaintNeeded]].
	"Open debuggers for all different errors found."
	errors
		ifNotNil: [[errors
				do: [:ea | (Debugger new
						process: ea key
						controller: nil
						context: ea key suspendedContext) errorWasInUIProcess: Processor activeProcess = Project current uiProcess;
						 openNotifierContents: nil label: ea value].
			"Try to draw the debuggers or else there will be no chance to
			escape from this catch-drawing-error loop."
			ActiveWorld displayWorld]
				on: Error
				do: [:ex | Project current handleFatalDrawingError: ex description]]