private
fixFontsAndScaleAround: block
	"Due to the current situation with fonts and the real-estate manager, this is a small workaround to support theme switching with largely different font sizes."

	lastScaleFactor ifNil: [lastScaleFactor := RealEstateAgent scaleFactor].

	"Due to the current font situation, update TextConstants."
	[	ignoreApply := true.
		(self get: #standardSystemFont) ifNotNil: [:font | Preferences setSystemFontTo: font].
		(self get: #standardFixedFont) ifNotNil: [:font | Preferences setFixedFontTo: font].
	] ensure: [ignoreApply := false].

	"Apply theme etc."
	block value.

	"Due to the current real-estate manager situation, resize all windows. Works only for Morphic projects."
	(RealEstateAgent scaleFactor - lastScaleFactor) abs > 0.1 ifTrue: [
		Project current isMorphic ifTrue: [
			| scale |
			scale := RealEstateAgent scaleFactor / lastScaleFactor.
			Project current world submorphs
				select: [:ea | ea isSystemWindow]
				thenDo: [:ea |
					ea extent: (ea extent * scale).
					ea layoutChanged.
					ea setFramesForLabelArea]]].

	lastScaleFactor := nil.