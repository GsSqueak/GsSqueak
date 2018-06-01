private
addMorphsTo: morphList from: aCollection allowSorting: sortBoolean withExpandedItems: expandedItems atLevel: newIndent 
	| _gsSqueakTemp_priorMorph _gsSqueakTemp_newCollection _gsSqueakTemp_firstAddition |
	_gsSqueakTemp_priorMorph := nil.
	_gsSqueakTemp_newCollection := (sortBoolean
					and: [sortingSelector notNil])
				ifTrue: [aCollection
						sorted: [:a :b | (a perform: sortingSelector)
								<= (b perform: sortingSelector)]]
				ifFalse: [aCollection].
	_gsSqueakTemp_firstAddition := nil.
	_gsSqueakTemp_newCollection
		do: [:item | 
			_gsSqueakTemp_priorMorph := self indentingItemClass basicNew
						initWithContents: item
						prior: _gsSqueakTemp_priorMorph
						forList: self
						indentLevel: newIndent.
			_gsSqueakTemp_priorMorph color: self textColor;
				 font: self font;
				 selectionColor: self selectionColor;
				 selectionTextColor: self selectionTextColor;
				 hoverColor: self hoverColor;
				 highlightTextColor: self highlightTextColor;
				 filterColor: self filterColor;
				 filterTextColor: self filterTextColor.
			_gsSqueakTemp_firstAddition
				ifNil: [_gsSqueakTemp_firstAddition := _gsSqueakTemp_priorMorph].
			morphList add: _gsSqueakTemp_priorMorph.
			((item hasEquivalentIn: expandedItems)
					or: [_gsSqueakTemp_priorMorph isExpanded])
				ifTrue: [_gsSqueakTemp_priorMorph isExpanded: true.
					_gsSqueakTemp_priorMorph
						addChildrenForList: self
						addingTo: morphList
						withExpandedItems: expandedItems]].
	^ _gsSqueakTemp_firstAddition