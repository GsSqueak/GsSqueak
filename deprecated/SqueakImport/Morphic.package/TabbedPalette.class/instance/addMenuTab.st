palette menu
addMenuTab
	"Add the menu tab.  This is ancient code, not much in the spirit of anything current"

	| aMenu aTab aGraphic sk |
	aMenu := MenuMorph new defaultTarget: self.
	aMenu stayUp: true.
	"aMenu add:  'clear' translated action: #showNoPalette."
	aMenu add:  'sort tabs' translated action: #sortTabs:.
	aMenu add:  'choose new colors for tabs' translated action: #recolorTabs.
	aMenu setProperty: #paletteMenu toValue: true.
	"aMenu add:  'make me the Standard palette' translated action: #becomeStandardPalette."
	aTab := self addTabForBook: aMenu  withBalloonText: 'a menu of palette-related controls' translated.
	aTab highlightColor: tabsMorph highlightColor; regularColor: tabsMorph regularColor.
	tabsMorph laySubpartsOutInOneRow; layoutChanged.

	aGraphic := ScriptingSystem formAtKey: 'TinyMenu'.
	aGraphic ifNotNil:
		[aTab removeAllMorphs.
		aTab addMorph: (sk := Project current world drawingClass withForm: aGraphic).
		sk position: aTab position.
		sk lock.
		aTab fitContents].
	self layoutChanged