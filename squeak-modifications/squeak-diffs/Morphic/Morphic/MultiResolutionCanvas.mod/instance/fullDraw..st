drawing-general
fullDraw: aMorph

	aMorph canDrawAtHigherResolution ifTrue: [
		deferredMorphs ifNil: [deferredMorphs := OrderedCollection new].
		deferredMorphs add: aMorph.
	] ifFalse: [
		super fullDraw: aMorph
	].