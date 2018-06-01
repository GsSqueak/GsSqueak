panes
holdsTranscript
	"ugh"
	| plug |
	^ paneMorphs size = 1 and: [((plug := paneMorphs first) isKindOf: PluggableTextMorph) and: [plug model isKindOf: TranscriptStream]]