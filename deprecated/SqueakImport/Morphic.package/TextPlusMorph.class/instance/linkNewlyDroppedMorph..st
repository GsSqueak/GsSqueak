as yet unclassified
linkNewlyDroppedMorph: aMorph

	| ed para lineToUse |

	ed := self editor.
	para := self paragraph.
	lineToUse := para lines detect: [ :each | each bottom > aMorph top] ifNone: [para lines last].
	ed selectFrom: lineToUse first to: lineToUse last.
	self addAlansAnchorFor: aMorph.

