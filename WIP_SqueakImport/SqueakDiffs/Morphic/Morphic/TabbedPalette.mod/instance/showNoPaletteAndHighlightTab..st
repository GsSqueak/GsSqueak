misc menu items
showNoPaletteAndHighlightTab: aTab

	| oldTab morphToInstall aSketchEditor |
	oldTab := tabsMorph highlightedTab.
	(oldTab notNil and: [(morphToInstall := oldTab morphToInstall) isKindOf: PaintBoxMorph])
		ifTrue:
			[(aSketchEditor := self world submorphOfClass: SketchEditorMorph) ifNotNil:
				[aSketchEditor cancelOutOfPainting].
			morphToInstall delete].

	currentPage ifNotNil: [currentPage delete].
	currentPage := nil.
	submorphs size > 1 ifTrue: "spurious submorphs, yecch"
		[(submorphs copyFrom: 2 to: submorphs size) do: [:m | m delete]].
	tabsMorph highlightTab: aTab