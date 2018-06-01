initialization
list: aCollection 
	| _gsSqueakTemp_wereExpanded _gsSqueakTemp_morphList |
	_gsSqueakTemp_wereExpanded := self currentlyExpanded.
	scroller removeAllMorphs.
	(aCollection isNil
			or: [aCollection isEmpty])
		ifTrue: [^ self selectedMorph: nil].
	_gsSqueakTemp_morphList := OrderedCollection new.
	self
		addMorphsTo: _gsSqueakTemp_morphList
		from: aCollection
		allowSorting: false
		withExpandedItems: _gsSqueakTemp_wereExpanded
		atLevel: 0.
	self insertNewMorphs: _gsSqueakTemp_morphList