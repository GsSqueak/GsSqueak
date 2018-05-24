private
addSubmorphsAfter: parentMorph fromCollection: aCollection allowSorting: sortBoolean

	| priorMorph morphList newCollection |
	priorMorph := nil.
	newCollection := (sortBoolean and: [sortingSelector notNil]) ifTrue: [
		aCollection sorted: [ :a :b | 
			(a perform: sortingSelector) <= (b perform: sortingSelector)]
	] ifFalse: [
		aCollection
	].
	morphList := OrderedCollection new.
	newCollection do: [:item | 
		priorMorph := self indentingItemClass basicNew 
			initWithContents: item 
			prior: priorMorph 
			forList: self
			indentLevel: parentMorph indentLevel + 1.
		priorMorph
			color: self textColor;
			font: self font;
			selectionColor: self selectionColor;
			selectionTextColor: self selectionTextColor;
			hoverColor: self hoverColor;
			highlightTextColor: self highlightTextColor;
			filterColor: self filterColor;
			filterTextColor: self filterTextColor.
		morphList add: priorMorph.
	].
	scroller addAllMorphs: morphList after: parentMorph.
	^morphList
	
