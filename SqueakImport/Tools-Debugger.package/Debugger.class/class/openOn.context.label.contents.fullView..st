opening
openOn: process context: context label: title contents: contentsStringOrNil fullView: bool
	"Open a notifier in response to an error, halt, or notify. A notifier view just shows a short
	view of the sender stack and provides a menu that lets the user open a full debugger.
	Dispatch the request to a method appropriate for the active project.
	The two versions for mvc & morphic are very close and can surely be merged so that this can be simplified"

	^ Project uiManager openDebugger: self on: process context: context label: title contents: contentsStringOrNil fullView: bool
