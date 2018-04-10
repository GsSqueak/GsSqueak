menu
removeFlexShell
	"Remove the shell used to make a morph rotatable and scalable."
	| _gsSqueakTemp_oldHalo _gsSqueakTemp_unflexed _gsSqueakTemp_pensDown _gsSqueakTemp_myWorld _gsSqueakTemp_refPos _gsSqueakTemp_aPosition |
	_gsSqueakTemp_refPos := self referencePosition.
	_gsSqueakTemp_myWorld := self world.
	_gsSqueakTemp_oldHalo := self halo.
	submorphs isEmpty
		ifTrue: [^ self delete].
	_gsSqueakTemp_aPosition := (owner submorphIndexOf: self)
				ifNil: [1].
	_gsSqueakTemp_unflexed := self firstSubmorph.
	_gsSqueakTemp_pensDown := OrderedCollection new.
	self
		allMorphsDo: [:m | | player | "Note any pens down -- must not be down during the move"
			((player := m player) notNil
					and: [player getPenDown])
				ifTrue: [m == player costume
						ifTrue: [_gsSqueakTemp_pensDown add: player.
							player setPenDown: false]]].
	self submorphs
		do: [:m | 
			m position: self center - (m extent // 2).
			owner addMorph: m asElementNumber: _gsSqueakTemp_aPosition].
	_gsSqueakTemp_unflexed absorbStateFromRenderer: self.
	_gsSqueakTemp_pensDown
		do: [:p | p setPenDown: true].
	_gsSqueakTemp_oldHalo
		ifNotNil: [_gsSqueakTemp_oldHalo setTarget: _gsSqueakTemp_unflexed].
	_gsSqueakTemp_myWorld
		ifNotNil: [_gsSqueakTemp_myWorld startSteppingSubmorphsOf: _gsSqueakTemp_unflexed].
	self delete.
	_gsSqueakTemp_unflexed referencePosition: _gsSqueakTemp_refPos.
	^ _gsSqueakTemp_unflexed