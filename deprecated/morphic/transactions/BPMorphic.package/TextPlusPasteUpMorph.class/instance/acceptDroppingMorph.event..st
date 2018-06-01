layout
acceptDroppingMorph: aMorph event: evt 
	| _gsSqueakTemp_allTextPlus |
	(aMorph isKindOf: NewHandleMorph)
		ifTrue: [^ self].
	(aMorph isKindOf: GeeBookMorph)
		ifTrue: [^ self].
	"avoid looping"
	(aMorph isKindOf: TextPlusMorph)
		ifTrue: [^ self addMorphBack: aMorph].
	self addMorph: aMorph.
	_gsSqueakTemp_allTextPlus := self allTextPlusMorphs.
	aMorph
		allMorphsDo: [:each | _gsSqueakTemp_allTextPlus
				do: [:e2 | e2 removeAlansAnchorFor: each]].
	(self nearestTextPlusMorphTo: aMorph)
		linkNewlyDroppedMorph: aMorph