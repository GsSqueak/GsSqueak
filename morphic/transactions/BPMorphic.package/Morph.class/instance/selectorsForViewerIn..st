-Etoys
selectorsForViewerIn: aCollection 
	"Answer a list of symbols representing all the selectors available in all
	my viewer categories, selecting only the ones in aCollection"
	| _gsSqueakTemp_aClass _gsSqueakTemp_aList _gsSqueakTemp_itsAdditions _gsSqueakTemp_added _gsSqueakTemp_addBlock |
	_gsSqueakTemp_aClass := self renderedMorph class.
	_gsSqueakTemp_aList := OrderedCollection new.
	_gsSqueakTemp_added := Set new.
	_gsSqueakTemp_addBlock := [:sym | (_gsSqueakTemp_added includes: sym)
				ifFalse: [(aCollection includes: sym)
						ifTrue: [_gsSqueakTemp_added add: sym.
							_gsSqueakTemp_aList add: sym]]].
	[_gsSqueakTemp_aClass == Morph superclass]
		whileFalse: [_gsSqueakTemp_aClass hasAdditionsToViewerCategories
				ifTrue: [_gsSqueakTemp_itsAdditions := _gsSqueakTemp_aClass allAdditionsToViewerCategories.
					_gsSqueakTemp_itsAdditions
						do: [:add | add
								do: [:aSpec | 
									"the spec list"
									aSpec first == #command
										ifTrue: [_gsSqueakTemp_addBlock value: aSpec second].
									aSpec first == #slot
										ifTrue: [_gsSqueakTemp_addBlock value: aSpec seventh.
											_gsSqueakTemp_addBlock value: aSpec ninth]]]].
			_gsSqueakTemp_aClass := _gsSqueakTemp_aClass superclass].
	^ _gsSqueakTemp_aList copyWithoutAll: #(#unused #dummy )"SimpleSliderMorph basicNew selectorsForViewerIn: 
	#(setTruncate: getColor setColor: getKnobColor setKnobColor:
	getWidth setWidth: getHeight setHeight: getDropEnabled
	setDropEnabled:) "