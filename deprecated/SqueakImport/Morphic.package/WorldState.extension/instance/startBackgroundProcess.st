*Morphic-MorphicExtras-update cycle
startBackgroundProcess
	"Start a process to update this world in the background. Return the process created."

	| p |
	p := [[
		self doOneCycleInBackground.
		(Delay forMilliseconds: 20) wait] repeat] newProcess.
	p resume.
	^ p
