ui requests
chooseFont: aPrompt for: aTarget setSelector: setSelector getSelector: getSelector
	"MVC Only! prompt for a font and if one is provided, send it to aTarget using a message with selector aSelector."
	| aMenu aChoice aStyle namesAndSizes aFont |
	aMenu := CustomMenu new.
	TextStyle actualTextStyles keysSortedSafely do:
		[:styleName |
			aMenu add: styleName action: styleName].
	aChoice := aMenu startUpWithCaption: aPrompt.
	aChoice ifNil: [^ self].
	aMenu := CustomMenu new.
	aStyle := TextStyle named: aChoice.
	(namesAndSizes := aStyle fontNamesWithPointSizes) do:
		[:aString | aMenu add: aString action: aString].
	aChoice := aMenu startUpWithCaption: nil.
	aChoice ifNil: [^ self].
	aFont := aStyle fontAt: (namesAndSizes indexOf: aChoice).
	aTarget perform: setSelector with: aFont