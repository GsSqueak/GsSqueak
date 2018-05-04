return bytecodes
commonCallerReturn
	"Return to the previous context/frame (sender for method activations, caller for block activations)."
	| callersFPOrNull |
	<var: #callersFPOrNull type: #'char *'>
	<sharedCodeNamed: 'commonCallerReturn' inCase: 125> "returnTopFromBlock"

	callersFPOrNull := self frameCallerFP: localFP.
	callersFPOrNull == 0 "baseFrame" ifTrue:
		[self assert: localFP = stackPage baseFP.
		 ^self baseFrameReturn].

	localIP := self frameCallerSavedIP: localFP.
	localSP := localFP + (self frameStackedReceiverOffset: localFP).
	localFP := callersFPOrNull.
	self internalStackTopPut: localReturnValue.
	self fetchNextBytecode.
	^self setMethod: (self frameMethod: localFP)