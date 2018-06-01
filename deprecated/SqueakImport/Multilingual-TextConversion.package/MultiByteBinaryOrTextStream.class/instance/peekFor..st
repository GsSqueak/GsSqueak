public
peekFor: item 

	| state |
	"self atEnd ifTrue: [^ false]. -- SFStream will give nil"
	state := converter saveStateOf: self.
	(self next ifNil: [ ^false ]) = item ifTrue: [ ^true ].
	converter restoreStateOf: self with: state.
	^ false.
