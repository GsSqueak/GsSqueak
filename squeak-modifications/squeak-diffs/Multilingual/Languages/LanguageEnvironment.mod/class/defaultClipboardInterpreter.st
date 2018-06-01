public query
defaultClipboardInterpreter
	ClipboardInterpreterClass ifNil: [ClipboardInterpreterClass := self currentPlatform class clipboardInterpreterClass].
	^ ClipboardInterpreterClass new.

