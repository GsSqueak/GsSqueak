context stack menu
stepIntoBlock
	"Send messages until you return to the present method context.
	 Used to step into a block in the method."

	self handleLabelUpdatesIn:
			[interruptedProcess stepToHome: self selectedContext]
		whenExecuting: self selectedContext.
	self resetContext: interruptedProcess stepToSendOrReturn