notifier menu
debug
	"Open a full DebuggerView."
	| topView |
	topView := self topView.
	topView model: nil.  "so close won't release me."
	self breakDependents.
	self openFullNoSuspendFrom: topView.
