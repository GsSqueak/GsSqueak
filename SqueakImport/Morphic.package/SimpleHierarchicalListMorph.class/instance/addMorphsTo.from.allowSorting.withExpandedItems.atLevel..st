private
addMorphsTo: morphList from: aCollection allowSorting: sortBoolean withExpandedItems: expandedItems atLevel: newIndent

	| priorMorph newCollection firstAddition |
	priorMorph := nil.
	newCollection := (sortBoolean and: [sortingSelector notNil]) ifTrue: [
		aCollection sorted: [ :a :b | 
			(a perform: sortingSelector) <= (b perform: sortingSelector)]
	] ifFalse: [
		aCollection
	].
	firstAddition := nil.
	newCollection do: [:item | 
		priorMorph := self indentingItemClass basicNew 
			initWithContents: item 
			prior: priorMorph 
			forList: self
			indentLevel: newIndent.
		priorMorph
			color: self textColor;
			font: self font;
			selectionColor: self selectionColor;
			selectionTextColor: self selectionTextColor;
			hoverColor: self hoverColor;
			highlightTextColor: self highlightTextColor;
			filterColor: self filterColor;
			filterTextColor: self filterTextColor.
		firstAddition ifNil: [firstAddition := priorMorph].
		morphList add: priorMorph.
		((item hasEquivalentIn: expandedItems) or: [priorMorph isExpanded]) ifTrue: [
			priorMorph isExpanded: true.
			priorMorph 
				addChildrenForList: self 
				addingTo: morphList
				withExpandedItems: expandedItems.
		].
	].
	^firstAddition
	
