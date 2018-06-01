private
getTextMorph: aStringOrMorph for: balloonOwner
	"Construct text morph."
	| m text |
	aStringOrMorph isMorph
		ifTrue: [m := aStringOrMorph]
		ifFalse: [BalloonFont
				ifNil: [text := aStringOrMorph]
				ifNotNil: [text := aStringOrMorph asText
									addAttribute: (TextFontReference toFont: balloonOwner balloonFont);
									addAttribute: (TextColor color: self balloonTextColor)].
			m := (TextMorph new contents: text) centered].
	m setToAdhereToEdge: #adjustedCenter.
	^ m