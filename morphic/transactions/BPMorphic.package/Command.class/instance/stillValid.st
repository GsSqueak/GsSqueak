command execution
stillValid
	"Answer whether the receiver is still valid."
	^ (undoTarget isMorph
			and: [undoTarget isInWorld])
		or: [redoTarget isMorph
				and: [redoTarget isInWorld]]