initialize
openNotifierContents: msgString label: label
	"Create, schedule and answer a notifier view with the given label and message. A notifier view shows just the message or the first several lines of the stack, with a menu that allows the user to open a full debugger if so desired."
	"NOTE: When this method returns, a new process has been scheduled to run the windows, and thus this notifier, but the previous active process has not been suspended.  The sender will do this."
	| msg builder spec |

	Sensor flushKeyboard.
	savedCursor := Cursor currentCursor.
	Cursor currentCursor: Cursor normal.
	msg := (label beginsWith: 'Space is low')
		ifTrue: [self lowSpaceChoices, (msgString ifNil: [String empty])]
		ifFalse: [msgString].
	builder := ToolBuilder default.
	spec := self buildNotifierWith: builder label: label message: msg.
	self expandStack.
	^[builder openDebugger: spec] ensure:
		[errorWasInUIProcess := Project current spawnNewProcessIfThisIsUI: interruptedProcess]
