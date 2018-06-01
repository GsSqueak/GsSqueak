scripting
authoringPrototype
	| aTabbedPalette aBook aTab |
	aTabbedPalette := self new markAsPartsDonor.
	aTabbedPalette pageSize: 200 @ 300.
	aTabbedPalette tabsMorph highlightColor: Color red regularColor: Color blue.
	aTabbedPalette addMenuTab.

	aBook := BookMorph new setNameTo: 'one'; pageSize: aTabbedPalette pageSize.
	aBook color: Color blue muchLighter.
	aBook removeEverything; insertPage; showPageControls.
	aBook currentPage addMorphBack: (Project current world drawingClass withForm: ScriptingSystem squeakyMouseForm).
	aTab := aTabbedPalette addTabForBook: aBook.

	aBook := BookMorph new setNameTo: 'two'; pageSize: aTabbedPalette pageSize.
	aBook color: Color red muchLighter.
	aBook removeEverything; insertPage; showPageControls.
	aBook currentPage addMorphBack: CurveMorph authoringPrototype.
	aTabbedPalette addTabForBook: aBook.

	aTabbedPalette selectTab: aTab.

	aTabbedPalette beSticky.
	aTabbedPalette tabsMorph hResizing: #spaceFill.
	^ aTabbedPalette