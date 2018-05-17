utilities
resumeProcess: aProcess
	"Adopt aProcess as the project process -- probably because of proceeding from a debugger"

	self current uiProcess: aProcess.
	aProcess resume