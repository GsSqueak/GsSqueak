*Morphic-opening
morphicOpenOn: process context: context label: title contents: contentsStringOrNil fullView: full 
	"Open a notifier in response to an error, halt, or notify. A notifier view just shows a short view of the sender stack and provides a menu that lets the user open a full debugger."
	
	ErrorRecursionGuard critical: [
		
		| errorWasInUIProcess debugger |
		ErrorRecursion ifTrue: [
			"self assert: process == Project current uiProcess -- DOCUMENTATION ONLY"
			self clearErrorRecursion.
			^ Project current handleFatalDrawingError: title].
		
		[ErrorRecursion not & Preferences logDebuggerStackToFile
			ifTrue: [Smalltalk logSqueakError: title inContext: context]]
				on: Error
				do: [:ex | ex return: nil].
		
		errorWasInUIProcess := Project current spawnNewProcessIfThisIsUI: process.
		
		"Schedule debugging in deferred UI message because
			1) If process is the current UI process, it is already broken.
			2) If process is some other process, it must not execute UI code"
		Project current addDeferredUIMessage: [
			self setErrorRecursion.
			
			debugger := self new process: process controller: nil context: context.
			full
				ifTrue: [debugger openFullNoSuspendLabel: title]
				ifFalse: [debugger openNotifierContents: contentsStringOrNil label: title].
			debugger errorWasInUIProcess: errorWasInUIProcess.
		
			"Try drawing the debugger tool at least once to avoid freeze."
			Project current world displayWorldSafely.
			
			self clearErrorRecursion]].
	
	process suspend.