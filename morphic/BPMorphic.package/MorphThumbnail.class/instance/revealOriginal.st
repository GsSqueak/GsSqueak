as yet unclassified
revealOriginal
	((owner isKindOf: PasteUpMorph)
			and: [owner alwaysShowThumbnail])
		ifTrue: [^ Beeper beep].
	morphRepresented owner isNil
		ifTrue: [^ owner replaceSubmorph: self by: morphRepresented].
	Beeper beep