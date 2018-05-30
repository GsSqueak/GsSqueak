*TrueType
initForSubtitles
"
	HostFont initForSubtitles
"

	HostFont textStyleFrom: 'Verdana' sizes: #(18 20 22 24 26 28) ranges: HostFont defaultRanges.

	StrikeFontSet installExternalFontFileName: 'greekFont.out' encoding: GreekEnvironment leadingChar encodingName: #Greek textStyleName: #DefaultMultiStyle.


	TTCFontReader encodingTag: SimplifiedChineseEnvironment leadingChar.
	TTCFontSet newTextStyleFromTTFile: 'C:\WINDOWS\Fonts\simhei.TTF'.

	TTCFontReader encodingTag: JapaneseEnvironment leadingChar.
	TTCFontSet newTextStyleFromTTFile: 'C:\WINDOWS\Fonts\msgothic.TTC'.

	TTCFontReader encodingTag: KoreanEnvironment leadingChar.
	TTCFontSet newTextStyleFromTTFile: 'C:\WINDOWS\Fonts\gulim.TTC'.
