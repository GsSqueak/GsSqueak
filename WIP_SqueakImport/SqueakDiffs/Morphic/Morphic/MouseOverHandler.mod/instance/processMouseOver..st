event handling
processMouseOver: anEvent 
	"Re-establish the z-order for all morphs wrt the given event"

	| hand localEvt focus evt |
	anEvent ifNil: [^ self].
	hand := anEvent hand.
	leftMorphs := mouseOverMorphs asIdentitySet.
	"Assume some coherence for the number of objects in over list"
	overMorphs := WriteStream on: (Array new: leftMorphs size).
	enteredMorphs := WriteStream on: #().
	"Now go looking for eventual mouse overs"
	hand handleEvent: anEvent asMouseOver.
	"Get out early if there's no change"
	(leftMorphs isEmpty and: [ enteredMorphs position = 0 ]) 
		ifTrue: [ ^self initializeTrackedMorphs ].
	focus := hand mouseFocus.
	"Send #mouseLeave as appropriate"
	evt := anEvent asMouseLeave.
	"Keep the order of the left morphs by recreating it from the mouseOverMorphs"
	leftMorphs size > 1 
		ifTrue:
			[leftMorphs := mouseOverMorphs select: [:m | leftMorphs includes: m]].
			leftMorphs do: [ :m | 
			(m == focus or: [m hasOwner: focus])
				ifFalse: [ overMorphs nextPut: m ]
				ifTrue: 
					[ localEvt := evt transformedBy: (m transformedFrom: hand).
					m handleEvent: localEvt ] ].
	enteredMorphs ifNil: [ "inform: was called in handleEvent:"
		^self initializeTrackedMorphs ].
	"Send #mouseEnter as appropriate"
	evt := anEvent asMouseEnter.
	enteredMorphs contents reverseDo: [ :m | 
		(m == focus or: [m hasOwner: focus]) ifTrue: [
			localEvt := evt transformedBy: (m transformedFrom: hand).
			m handleEvent: localEvt ] ].
	"And remember the over list"
	overMorphs ifNotNil: [ mouseOverMorphs := overMorphs contents ].
	self initializeTrackedMorphs