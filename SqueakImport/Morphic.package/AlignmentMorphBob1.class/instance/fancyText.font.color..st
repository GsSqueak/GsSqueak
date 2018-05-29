as yet unclassified
fancyText: aString font: aFont color: aColor 
	| answer tm col |
	col := Preferences menuAppearance3d
				ifTrue: [aColor]
				ifFalse: [aColor negated].
	tm := TextMorph new.
	tm beAllFont: aFont;
		 color: col;
		 contents: aString.
	answer := self inAColumn: {tm}.
	Preferences menuAppearance3d
		ifTrue: [""
			tm addDropShadow.
			tm shadowPoint: 5 @ 5 + tm bounds center].
	tm lock.
	^ answer