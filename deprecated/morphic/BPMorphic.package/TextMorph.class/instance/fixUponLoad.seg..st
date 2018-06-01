objects from disk
fixUponLoad: aProject seg: anImageSegment 
	"We are in an old project that is being loaded from disk. Fix up
	conventions that have changed."
	| _gsSqueakTemp_substituteFont |
	_gsSqueakTemp_substituteFont := aProject projectParameters
				at: #substitutedFont
				ifAbsent: [#none].
	(_gsSqueakTemp_substituteFont ~~ #none
			and: [self textStyle fontArray includes: _gsSqueakTemp_substituteFont])
		ifTrue: [self fit].
	^ super fixUponLoad: aProject seg: anImageSegment