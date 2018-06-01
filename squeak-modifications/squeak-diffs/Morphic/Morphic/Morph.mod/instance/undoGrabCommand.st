dropping/grabbing
undoGrabCommand
	"Return an undo command for grabbing the receiver"

	| cmd |
	owner ifNil:
		[^ nil]. "no owner - no undo"
	^ (cmd := Command new)
		cmdWording: 'move ' translated, self nameForUndoWording;
		undoTarget: self
		selector: #undoMove:redo:owner:bounds:predecessor:
		arguments: {cmd. false. owner. self bounds. (owner morphPreceding: self)};
		yourself