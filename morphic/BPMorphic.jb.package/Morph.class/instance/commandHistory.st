undo
commandHistory
	"Return the command history for the receiver"
	| w |
	(w := self world)
		ifNotNil: [^ w commandHistory].
	(w := self currentWorld)
		ifNotNil: [^ w commandHistory].
	^ CommandHistory new"won't really record anything but prevent breaking things"