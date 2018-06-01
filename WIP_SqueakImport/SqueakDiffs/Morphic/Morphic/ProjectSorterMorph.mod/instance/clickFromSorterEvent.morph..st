as yet unclassified
clickFromSorterEvent: evt morph: aMorph

	| where what |
	(aMorph bounds containsPoint: evt cursorPoint) ifFalse: [^self].
	evt isMouseUp ifFalse: [
		evt shiftPressed ifFalse: [^evt hand grabMorph: aMorph].
		^self
	].

	evt shiftPressed ifTrue: [
		where := aMorph owner submorphs indexOf: aMorph ifAbsent: [nil].
		what := book threadName.
		WorldState addDeferredUIMessage: [
			InternalThreadNavigationMorph openThreadNamed: what atIndex: where
		].
		(Project named: (aMorph valueOfProperty: #nameOfThisProject)) enter.
	].
