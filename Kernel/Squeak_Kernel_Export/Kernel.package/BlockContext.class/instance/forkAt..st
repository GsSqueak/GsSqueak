scheduling
forkAt: priority 
	"Create and schedule a Process running the code in the receiver at the given priority. Answer the newly created process."

	| forkedProcess |
	forkedProcess := self newProcess.
	forkedProcess priority: priority.
	^ forkedProcess resume
