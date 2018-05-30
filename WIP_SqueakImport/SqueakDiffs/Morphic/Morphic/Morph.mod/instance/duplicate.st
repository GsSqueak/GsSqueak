copying
duplicate
	"Make and return a duplicate of the receiver"

	| newMorph aName w aPlayer topRend |
	((topRend := self topRendererOrSelf) ~~ self) ifTrue: [^ topRend duplicate].

	self okayToDuplicate ifFalse: [^ self].
	aName := (w := self world) ifNotNil:
		[w nameForCopyIfAlreadyNamed: self].
	newMorph := self veryDeepCopy.
	aName ifNotNil: [newMorph setNameTo: aName].

	newMorph arrangeToStartStepping.
	newMorph privateOwner: nil. "no longer in world"
	newMorph isPartsDonor: false. "no longer parts donor"
	(aPlayer := newMorph player) belongsToUniClass ifTrue:
		[aPlayer class bringScriptsUpToDate].
	aPlayer ifNotNil: [ActiveWorld presenter flushPlayerListCache].
	^ newMorph