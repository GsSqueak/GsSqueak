handling
defaultAction
	"The current computation is terminated. The cause of the error should be logged or reported to the user. If the program is operating in an interactive debugging environment the computation should be suspended and the debugger activated."
    
	"^ToolSet debugError: self exception" "We do not have a Debugger yet"
	^ self _env0 defaultAction
