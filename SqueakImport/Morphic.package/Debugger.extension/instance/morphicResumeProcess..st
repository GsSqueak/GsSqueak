*Morphic-opening
morphicResumeProcess: aTopView 

	| processToResume |
	processToResume := interruptedProcess.
	interruptedProcess := nil. "Before delete, so release doesn't terminate it"
	aTopView delete.
	Project current world displayWorld. "We have to redraw *before* resuming the old process."
	Smalltalk installLowSpaceWatcher. "restart low space handler"

	savedCursor
		ifNotNil: [Cursor currentCursor: savedCursor].
	processToResume isTerminated ifFalse: [
		errorWasInUIProcess
					ifTrue: [Project resumeProcess: processToResume]
					ifFalse: [processToResume resume]].
	"if old process was terminated, just terminate current one"
	errorWasInUIProcess == false
		ifFalse: [Processor terminateActive]