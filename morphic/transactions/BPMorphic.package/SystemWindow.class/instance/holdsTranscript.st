panes
holdsTranscript
	"ugh"
	| _gsSqueakTemp_plug |
	^ paneMorphs size = 1
		and: [((_gsSqueakTemp_plug := paneMorphs first) isKindOf: PluggableTextMorph)
				and: [_gsSqueakTemp_plug model isKindOf: TranscriptStream]]