slots-user
offerGetterTiles: slotName 
	"For a player-type slot, offer to build convenient compound tiles that
	otherwise would be hard to get"
	| _gsSqueakTemp_typeChoices _gsSqueakTemp_typeChosen _gsSqueakTemp_thePlayerThereNow _gsSqueakTemp_slotChoices _gsSqueakTemp_slotChosen _gsSqueakTemp_getterTiles _gsSqueakTemp_aCategoryViewer _gsSqueakTemp_playerGetter |
	_gsSqueakTemp_typeChoices := Vocabulary typeChoices.
	_gsSqueakTemp_typeChosen := UIManager default
				chooseFrom: (_gsSqueakTemp_typeChoices
						collect: [:t | t translated])
				values: _gsSqueakTemp_typeChoices
				title: ('Choose the TYPE
of data to get from
{1}''s {2}' translated format: {self externalName. slotName translated}).
	_gsSqueakTemp_typeChosen isEmptyOrNil
		ifTrue: [^ self].
	_gsSqueakTemp_thePlayerThereNow := self perform: slotName asGetterSelector.
	_gsSqueakTemp_thePlayerThereNow
		ifNil: [_gsSqueakTemp_thePlayerThereNow := self presenter standardPlayer].
	_gsSqueakTemp_slotChoices := _gsSqueakTemp_thePlayerThereNow slotNamesOfType: _gsSqueakTemp_typeChosen.
	_gsSqueakTemp_slotChoices isEmpty
		ifTrue: [^ self inform: 'sorry -- no slots of that type' translated].
	_gsSqueakTemp_slotChoices := _gsSqueakTemp_slotChoices asSortedArray.
	_gsSqueakTemp_slotChosen := UIManager default
				chooseFrom: (_gsSqueakTemp_slotChoices
						collect: [:t | t translated])
				values: _gsSqueakTemp_slotChoices
				title: ('Choose the datum
you want to extract from {1}''s {2}' translated format: {self externalName. slotName translated}).
	_gsSqueakTemp_slotChosen isEmptyOrNil
		ifTrue: [^ self].
	"Now we want to tear off tiles of the form
	holder's valueAtCursor's foo"
	_gsSqueakTemp_getterTiles := nil.
	_gsSqueakTemp_aCategoryViewer := CategoryViewer new initializeFor: _gsSqueakTemp_thePlayerThereNow categoryChoice: 'basic'.
	_gsSqueakTemp_getterTiles := _gsSqueakTemp_aCategoryViewer getterTilesFor: _gsSqueakTemp_slotChosen asGetterSelector type: _gsSqueakTemp_typeChosen.
	_gsSqueakTemp_aCategoryViewer := CategoryViewer new initializeFor: self categoryChoice: 'basic'.
	_gsSqueakTemp_playerGetter := _gsSqueakTemp_aCategoryViewer getterTilesFor: slotName asGetterSelector type: #Player.
	_gsSqueakTemp_getterTiles submorphs first acceptDroppingMorph: _gsSqueakTemp_playerGetter event: nil.
	"the pad"
	"simulate a drop"
	_gsSqueakTemp_getterTiles makeAllTilesGreen.
	_gsSqueakTemp_getterTiles justGrabbedFromViewer: false.
	_gsSqueakTemp_getterTiles firstSubmorph changeTableLayout; hResizing: #shrinkWrap; vResizing: #spaceFill.
	ActiveHand attachMorph: _gsSqueakTemp_getterTiles