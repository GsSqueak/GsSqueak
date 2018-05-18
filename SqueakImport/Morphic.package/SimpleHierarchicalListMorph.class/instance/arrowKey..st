keyboard navigation
arrowKey: asciiValue
	"Handle a keyboard navigation character. Answer true if handled, false if not."
	| keyEvent max oldSelection nextSelection howManyItemsShowing keyHandled |
	keyHandled := false.
	keyEvent := asciiValue.
	max := self maximumSelection.
	nextSelection := oldSelection := self getSelectionIndex.
     keyEvent = 31 ifTrue:["down"
		keyHandled := true.
		nextSelection :=oldSelection + 1.
		nextSelection > max ifTrue: [nextSelection := (self class wrappedNavigation ifTrue: [1] ifFalse: [max])]].
     keyEvent = 30 ifTrue:["up"
		keyHandled := true.
		nextSelection := oldSelection - 1.
		nextSelection < 1 ifTrue: [nextSelection := self class wrappedNavigation ifTrue: [max] ifFalse: [1]]].
     keyEvent = 1  ifTrue: ["home"
		keyHandled := true.
		nextSelection := 1].
     keyEvent = 4  ifTrue: ["end"
		keyHandled := true.
		nextSelection := max].
	howManyItemsShowing := self numSelectionsInView.
      keyEvent = 11 ifTrue: ["page up"
		keyHandled := true.
		nextSelection := 1 max: oldSelection - howManyItemsShowing].
     keyEvent = 12  ifTrue: ["page down"
		keyHandled := true.
		nextSelection := oldSelection + howManyItemsShowing min: max].

	(nextSelection ~= oldSelection or: [ keyHandled and: [ self class wrappedNavigation not ]]) ifTrue: [
		self setSelectionIndex: nextSelection.
		^ true].
	
	keyEvent = 29 ifTrue:["right"
		selectedMorph ifNotNil:[
			(selectedMorph canExpand and:[selectedMorph isExpanded not])
				ifTrue:[self toggleExpandedState: selectedMorph]
				ifFalse:[self setSelectionIndex: self getSelectionIndex+1].
		].
		^true].
	keyEvent = 28 ifTrue:["left"
		selectedMorph ifNotNil:[
			(selectedMorph isExpanded)
				ifTrue:[self toggleExpandedState: selectedMorph]
				ifFalse:[self setSelectionIndex: (self getSelectionIndex-1 max: 1)].
		].
		^true].
	^false