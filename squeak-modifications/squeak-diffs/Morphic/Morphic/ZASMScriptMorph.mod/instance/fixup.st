as yet unclassified
fixup

	| newMorphs state fixed |

	somethingChanged := false.
	newMorphs := OrderedCollection new.
	state := #new.
	fixed := false.
	submorphs do: [ :each |
		(each isKindOf: ZASMCameraMarkMorph) ifTrue: [
			state == #mark ifTrue: [
				newMorphs add: (
					ZASMStepsMorph new setStepCount: 10
				).
				fixed := true.
			].
			newMorphs add: each.
			state := #mark.
		].
		(each isKindOf: ZASMStepsMorph) ifTrue: [
			state == #steps ifTrue: [
				fixed := true.
			] ifFalse: [
				newMorphs add: each.
				state := #steps.
			].
		].
	].
	fixed ifTrue: [
		self removeAllMorphs.
		self addAllMorphs: newMorphs.
	].