private
updateHashTable: table delta: delta
	| pos |
	self notYetImplemented.
	1 to: table size do:[:i|
		"Discard entries that are out of range"
		(pos := table at: i) >= delta
			ifTrue:[table at: i put: pos - delta]
			ifFalse:[table at: i put: 0]].