layout
acceptDroppingMorph: aMorph event: evt

	| allTextPlus |

	(aMorph isKindOf: NewHandleMorph) ifTrue: [^self].
	(aMorph isKindOf: GeeBookMorph) ifTrue: [^self].	"avoid looping"
	(aMorph isKindOf: TextPlusMorph) ifTrue: [
		^self addMorphBack: aMorph.
	].
	self addMorph: aMorph.

	allTextPlus := self allTextPlusMorphs.
	aMorph allMorphsDo: [ :each | 
		allTextPlus do: [ :e2 | e2 removeAlansAnchorFor: each].
	].
	(self nearestTextPlusMorphTo: aMorph) linkNewlyDroppedMorph: aMorph