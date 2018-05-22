active process
spawnNewProcessIfThisIsUI: suspendedProcess
	"Initialize a UI process if needed. Answer true if suspendedProcess was interrupted
	from a UI process."
	self subclassResponsibility