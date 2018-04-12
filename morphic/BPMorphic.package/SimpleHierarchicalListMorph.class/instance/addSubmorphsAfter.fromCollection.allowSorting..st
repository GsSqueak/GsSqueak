private
addSubmorphsAfter: parentMorph fromCollection: aCollection allowSorting: sortBoolean 
	| _gsSqueakTemp_priorMorph _gsSqueakTemp_morphList _gsSqueakTemp_newCollection |
	_gsSqueakTemp_priorMorph := nil.
	_gsSqueakTemp_newCollection := (sortBoolean
					and: [sortingSelector notNil])
				ifTrue: [aCollection
						sorted: [:a :b | (a perform: sortingSelector)
								<= (b perform: sortingSelector)]]
				ifFalse: [aCollection].
	_gsSqueakTemp_morphList := OrderedCollection new.
	_gsSqueakTemp_newCollection
		do: [:item | 
			_gsSqueakTemp_priorMorph := self indentingItemClass basicNew
						initWithContents: item
						prior: _gsSqueakTemp_priorMorph
						forList: self
						indentLevel: parentMorph indentLevel + 1.
			_gsSqueakTemp_priorMorph color: self textColor;
				 font: self font;
				 selectionColor: self selectionColor;
				 selectionTextColor: self selectionTextColor;
				 hoverColor: self hoverColor;
				 highlightTextColor: self highlightTextColor;
				 filterColor: self filterColor;
				 filterTextColor: self filterTextColor.
			_gsSqueakTemp_morphList add: _gsSqueakTemp_priorMorph].
	scroller addAllMorphs: _gsSqueakTemp_morphList after: parentMorph.
	^ _gsSqueakTemp_morphList