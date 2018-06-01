selection
getCurrentSelectionItem
	"Our models are supposed to return real objects, not wrappers. See
	PluggableTreeItemNode. "
	| _gsSqueakTemp_selectedObject |
	_gsSqueakTemp_selectedObject := self getSelectedSelector
				ifNil: [^ nil]
				ifNotNil: [:symbol | model perform: symbol].
	^ scroller submorphs
		detect: [:each | each complexContents item == _gsSqueakTemp_selectedObject]
		ifFound: [:each | each complexContents]
		ifNone: []