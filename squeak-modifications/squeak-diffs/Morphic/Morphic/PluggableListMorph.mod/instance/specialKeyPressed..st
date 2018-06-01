model access
specialKeyPressed: asciiValue
	"A special key with the given ascii-value was pressed; dispatch it"
	| oldSelection nextSelection max howManyItemsShowing |
	(#(8 13) includes: asciiValue) ifTrue:
		[ "backspace key - clear the filter, restore the list with the selection" 
		model okToChange ifFalse: [^ self].
		self removeFilter.
		priorSelection ifNotNil:
			[ | prior |
			prior := priorSelection.
			priorSelection := self getCurrentSelectionIndex.
			asciiValue = 8 ifTrue: [ self changeModelSelection: prior ] ].
		^ self updateList ].
	asciiValue = 27 ifTrue: 
		[" escape key"
		^ ActiveEvent shiftPressed
			ifTrue:
				[ActiveWorld putUpWorldMenuFromEscapeKey]
			ifFalse:
				[self yellowButtonActivity: false]].

	max := self maximumSelection.
	max > 0 ifFalse: [^ self].
	nextSelection := oldSelection := self selectionIndex.
	asciiValue = 31 ifTrue: 
		[" down arrow"
		nextSelection := oldSelection + 1.
		nextSelection > max ifTrue: [nextSelection := 1]].
	asciiValue = 30 ifTrue: 
		[" up arrow"
		nextSelection := oldSelection - 1.
		nextSelection < 1 ifTrue: [nextSelection := max]].
	asciiValue = 1 ifTrue:
		[" home"
		nextSelection := 1].
	asciiValue = 4 ifTrue:
		[" end"
		nextSelection := max].
	howManyItemsShowing := self numSelectionsInView.
	asciiValue = 11 ifTrue:
		[" page up"
		nextSelection := 1 max: oldSelection - howManyItemsShowing].
	asciiValue = 12 ifTrue:
		[" page down"
		nextSelection := oldSelection + howManyItemsShowing min: max].
	model okToChange ifFalse: [^ self].
	"No change if model is locked"
	oldSelection = nextSelection ifTrue: [^ self flash].
	^ self changeModelSelection: (self modelIndexFor: nextSelection)