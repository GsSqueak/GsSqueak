public
contents
	| ret state |
	state := converter saveStateOf: self.
	self position: 0.
	ret := self upToEnd.
	converter restoreStateOf: self with: state.
	^ ret
