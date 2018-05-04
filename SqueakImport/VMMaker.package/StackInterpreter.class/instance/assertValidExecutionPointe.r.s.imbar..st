debug support
assertValidExecutionPointe: lip r: lfp s: lsp imbar: inInterpreter
	<var: #lip type: #'char *'>
	<var: #lfp type: #'char *'>
	<var: #lsp type: #'char *'>
	self assert: inInterpreter.
	self assert: stackPage = (stackPages stackPageFor: lfp).
	self assert: stackPage = stackPages mostRecentlyUsedPage.
	self assertValidStackLimits.
	self assert: lfp < stackPage baseAddress.
	self assert: lsp < lfp.
	self assert: lfp > lsp.
	self assert: lsp >= (stackPage realStackLimit - self stackLimitOffset).
	self assert:  (lfp - lsp) < LargeContextSize.
	self assert: (self validInstructionPointer: lip inFrame: lfp).
	self assert: ((self frameIsBlockActivation: lfp)
				or: [(self pushedReceiverOrClosureOfFrame: lfp) = (self frameReceiver: lfp)])