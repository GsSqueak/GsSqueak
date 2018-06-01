menu
removeFlexShell
	"Remove the shell used to make a morph rotatable and scalable."

	| oldHalo unflexed pensDown myWorld refPos aPosition |
	self isInWorld ifFalse: [^self].
	refPos := self referencePosition.
	myWorld := self world.
	oldHalo := self halo.
	submorphs isEmpty ifTrue: [^ self delete].
	aPosition := (owner submorphIndexOf: self) ifNil: [1].
	unflexed := self firstSubmorph.
	pensDown := OrderedCollection new.
	self allMorphsDo:  "Note any pens down -- must not be down during the move"
		[:m | | player |
		((player := m player) notNil and: [player getPenDown]) ifTrue:
			[m == player costume ifTrue:
				[pensDown add: player.
				player setPenDown: false]]].
	self submorphs do: [:m |
		m position: self center - (m extent // 2).
		owner addMorph: m asElementNumber: aPosition].
	unflexed absorbStateFromRenderer: self.
	pensDown do: [:p | p setPenDown: true].
	oldHalo ifNotNil: [oldHalo setTarget: unflexed].
	myWorld ifNotNil: [myWorld startSteppingSubmorphsOf: unflexed].
	self delete.
	unflexed referencePosition: refPos.
	^ unflexed