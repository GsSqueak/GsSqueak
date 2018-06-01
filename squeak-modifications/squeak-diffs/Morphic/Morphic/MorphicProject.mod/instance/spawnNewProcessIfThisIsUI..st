active process
spawnNewProcessIfThisIsUI: suspendedProcess
	"Initialize a UI process if needed. Answer true if suspendedProcess was interrupted
	from a UI process."
	self uiProcess == suspendedProcess ifTrue: [
		self spawnNewProcess.
		^true
	].

	"Ensure that the UI process is running."
	self uiProcess
		ifNil: [self spawnNewProcess]
		ifNotNil: [:p | p isSuspended ifTrue: [
			self restoreDisplay.
			self uiProcess resume]].

	^false		"no new process was created"
