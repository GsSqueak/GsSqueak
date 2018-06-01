initialization
newTabs: tabsList
	"Reconstitute the palette based on info in the tabs list"

	| color1 color2 color3 |
	pages := pages species new.
	tabsMorph ifNotNil:
		[color1 := tabsMorph  highlightColor.
		color2 := tabsMorph regularColor.
		color3 := tabsMorph color.
		tabsMorph delete].
	tabsMorph := IndexTabs new.
	self addMorphFront: tabsMorph.
	color1 ifNotNil:
		[tabsMorph highlightColor: color1 regularColor: color2; color: color3].
	currentPage ifNotNil:
		[currentPage delete.
		currentPage := nil].
	tabsList do:
		[:aTab | | itsBook |
			tabsMorph addTab: aTab.
			aTab unHighlight.
			(itsBook := aTab morphToInstall) ifNotNil:
					[pages add: itsBook.
					currentPage ifNil: [currentPage := itsBook]]].
	tabsMorph position: self position + self borderWidth