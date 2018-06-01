menu
instrumentChoicesForTrack: trackIndex
	| names |
	names := AbstractSound soundNames asOrderedCollection.
	names := names collect: [:n |
		| inst |
		inst := AbstractSound soundNamed: n.
		(inst isKindOf: UnloadedSound)
			ifTrue: [n, '(out)']
			ifFalse: [n]].
	names add: 'clink'.
	names add: 'edit ', (instrumentSelector at: trackIndex) contents.
	^ names asArray
