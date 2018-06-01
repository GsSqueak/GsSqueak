objects from disk
fixUponLoad: aProject seg: anImageSegment
	"We are in an old project that is being loaded from disk.
Fix up conventions that have changed."

	| substituteFont |
	substituteFont := aProject projectParameters at:
#substitutedFont ifAbsent: [#none].
	(substituteFont ~~ #none and: [self font == substituteFont])
			ifTrue: [ self fitContents ].

	^ super fixUponLoad: aProject seg: anImageSegment