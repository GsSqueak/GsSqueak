enter
suspendProcessForDebug

	| p |
	self assert: Processor activeProcess == uiProcess.
	
	p := uiProcess.
	uiProcess := nil.
	p suspend.