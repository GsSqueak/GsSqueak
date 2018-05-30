updating
update: aSymbol 
	"Refer to the comment in View|update:."
	aSymbol == getListSelector ifTrue:
		[ self updateList.
		^ self ].
	aSymbol == getIndexSelector ifTrue:
		[ | uiIndex modelIndex |
		uiIndex := self uiIndexFor: (modelIndex := self getCurrentSelectionIndex).
		self selectionIndex:
			(uiIndex = 0
				ifTrue:
					[ "The filter is preventing us from selecting the item we want - remove it."
					(modelIndex > 0 and: [list notNil and: [list size > 0]]) ifTrue: [ self removeFilter; updateList ].
					modelIndex ]
				ifFalse: [ uiIndex ]).
		^ self ]