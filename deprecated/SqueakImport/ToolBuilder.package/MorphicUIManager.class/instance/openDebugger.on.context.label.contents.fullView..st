ui project indirecting
openDebugger: aDebugger on: process context: context label: title contents: contentsStringOrNil fullView: bool
	"open a debugger - the two versions for mvc & morphic are very close and can surely be merged so that this can be removed"
	^aDebugger morphicOpenOn: process context: context label: title contents: contentsStringOrNil fullView: bool