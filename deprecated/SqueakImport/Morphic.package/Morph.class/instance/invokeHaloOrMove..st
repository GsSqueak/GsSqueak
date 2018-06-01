meta-actions
invokeHaloOrMove: anEvent
	"Special gestures (cmd-mouse on the Macintosh; Alt-mouse on Windows and Unix) allow a mouse-sensitive morph to be moved or bring up a halo for the morph."
	| h tfm doNotDrag |
	h := anEvent hand halo.
	"Prevent wrap around halo transfers originating from throwing the event back in"
	doNotDrag := false.
	h ifNotNil:[
		(h innerTarget == self) ifTrue:[doNotDrag := true].
		(h innerTarget hasOwner: self) ifTrue:[doNotDrag := true].
		(self hasOwner: h target) ifTrue:[doNotDrag := true]].

	tfm := (self transformedFrom: nil) inverseTransformation.

	"cmd-drag on flexed morphs works better this way"
	h := self addHalo: (anEvent transformedBy: tfm).
	h ifNil: [^ self].
	doNotDrag ifTrue:[^self].
	"Initiate drag transition if requested"
	anEvent hand 
		waitForClicksOrDrag: h
		event: (anEvent transformedBy: tfm)
		selectors: { nil. nil. nil. #startDragTarget:. }
		threshold: HandMorph dragThreshold.
	"Pass focus explicitly here"
	anEvent hand newMouseFocus: h.
	"Reset temporary cursors to make available halo interaction visible."
	anEvent hand showTemporaryCursor: nil.