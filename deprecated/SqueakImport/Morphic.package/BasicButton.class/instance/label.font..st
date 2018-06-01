as yet unclassified
label: aString font: aFontOrNil

	| oldLabel m aFont |
	(oldLabel := self findA: StringMorph)
		ifNotNil: [oldLabel delete].
	aFont := aFontOrNil ifNil: [Preferences standardButtonFont].
	m := StringMorph contents: aString font: aFont.
	self extent: (m width + 6) @ (m height + 6).
	m position: self center - (m extent // 2).
	self addMorph: m.
	m lock
