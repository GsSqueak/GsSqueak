message list
messageListKey: aChar from: view
	"Respond to a command key. Handle (m) and (n) here,
	else defer to the StringHolder behaviour."

	aChar == $m ifTrue: [^ self implementors].
	aChar == $n ifTrue: [^ self senders].
	super messageListKey: aChar from: view
