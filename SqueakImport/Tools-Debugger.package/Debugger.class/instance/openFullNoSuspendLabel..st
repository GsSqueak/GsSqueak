initialize
openFullNoSuspendLabel: aString
	"Create, schedule and answer a full debugger with the given label. Do not terminate the current active process."

	| oldContextStackIndex |
	oldContextStackIndex := contextStackIndex.
	self expandStack. "Sets contextStackIndex to zero."
	^[ToolBuilder default openDebugger: self label: aString] ensure:
		[self toggleContextStackIndex: oldContextStackIndex]