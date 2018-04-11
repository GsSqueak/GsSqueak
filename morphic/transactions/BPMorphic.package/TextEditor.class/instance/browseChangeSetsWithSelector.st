menu messages
browseChangeSetsWithSelector
	"Determine which, if any, change sets have at least one change for the
	selected selector, independent of class"
	| _gsSqueakTemp_aSelector |
	self
		lineSelectAndEmptyCheck: [^ self].
	(_gsSqueakTemp_aSelector := self selectedSelector) == nil
		ifTrue: [^ morph flash].
	ChangeSorter browseChangeSetsWithSelector: _gsSqueakTemp_aSelector