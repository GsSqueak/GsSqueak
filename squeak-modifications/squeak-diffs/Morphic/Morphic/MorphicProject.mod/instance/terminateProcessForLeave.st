enter
terminateProcessForLeave
	"There is only one UI process. Kill it."
	
	self assert: Processor activeProcess == uiProcess.
	uiProcess := nil.
	Processor terminateActive.