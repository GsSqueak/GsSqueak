font mapping
postscriptFontMappingSummary
	"
	Transcript nextPutAll: 
	PostscriptCanvas postscriptFontMappingSummary
	; endEntry
	"
	| stream |
	stream := WriteStream on: (String new: 1000).
	TextStyle actualTextStyles keysAndValuesDo: [ :styleName :style |
		stream nextPutAll: styleName; cr.
		style fontArray do: [ :baseFont | | info |
			0 to: 3 do: [ :i | | font |
				font := baseFont emphasized: i.
				font emphasis = i ifTrue: [
					stream tab; nextPutAll: font fontNameWithPointSize; tab.
					info := self postscriptFontInfoForFont: font.
					stream nextPutAll: info first; space; print: (font pixelSize * info second) rounded.
					stream cr.
				]
			]
		]
	].
	^stream contents