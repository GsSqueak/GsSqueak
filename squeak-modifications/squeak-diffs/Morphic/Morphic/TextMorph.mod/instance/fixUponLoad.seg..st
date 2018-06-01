objects from disk
fixUponLoad: aProject seg: anImageSegment
	"We are in an old project that is being loaded from disk. Fix up conventions that have changed."

	| substituteFont |
	substituteFont := aProject projectParameters at: #substitutedFont ifAbsent: [#none].
	(substituteFont ~~ #none and: [self textStyle fontArray includes: substituteFont])
			ifTrue: [ self fit ].

	^ super fixUponLoad: aProject seg: anImageSegment