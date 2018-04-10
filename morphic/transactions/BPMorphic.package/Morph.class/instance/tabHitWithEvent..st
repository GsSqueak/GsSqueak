-Etoys-card in a stack
tabHitWithEvent: anEvent 
	"The tab key was hit. The keyboard focus has referred this event to
	me, though this perhaps seems rather backwards. Anyway, the
	assumption is that I have the property #tabAmongFields, so now the
	task is to tab to the next field."
	| _gsSqueakTemp_currentFocus _gsSqueakTemp_fieldList _gsSqueakTemp_anIndex _gsSqueakTemp_itemToHighlight _gsSqueakTemp_variableBearingMorphs _gsSqueakTemp_otherAmenableMorphs |
	_gsSqueakTemp_currentFocus := anEvent hand keyboardFocus.
	_gsSqueakTemp_fieldList := self allMorphs
				select: [:aMorph | aMorph wouldAcceptKeyboardFocusUponTab
						and: [aMorph isLocked not]].
	_gsSqueakTemp_fieldList isEmpty
		ifTrue: [^ self].
	_gsSqueakTemp_variableBearingMorphs := self player isNil
				ifTrue: [#()]
				ifFalse: [self player class variableDocks
						collect: [:vd | vd definingMorph]
						thenSelect: [:m | m isInWorld]].
	_gsSqueakTemp_otherAmenableMorphs := (self allMorphs
				select: [:aMorph | aMorph wouldAcceptKeyboardFocusUponTab
						and: [aMorph isLocked not]])
				copyWithoutAll: _gsSqueakTemp_variableBearingMorphs.
	_gsSqueakTemp_fieldList := _gsSqueakTemp_variableBearingMorphs , _gsSqueakTemp_otherAmenableMorphs.
	_gsSqueakTemp_anIndex := _gsSqueakTemp_fieldList
				indexOf: _gsSqueakTemp_currentFocus
				ifAbsent: [].
	_gsSqueakTemp_itemToHighlight := _gsSqueakTemp_fieldList
				atWrap: (_gsSqueakTemp_anIndex
						ifNil: [1]
						ifNotNil: [anEvent shiftPressed
								ifTrue: [_gsSqueakTemp_anIndex - 1]
								ifFalse: [_gsSqueakTemp_anIndex + 1]]).
	anEvent hand newKeyboardFocus: _gsSqueakTemp_itemToHighlight.
	self flag: #arNote.
	"really???"
	_gsSqueakTemp_itemToHighlight editor selectAll.
	_gsSqueakTemp_itemToHighlight invalidRect: _gsSqueakTemp_itemToHighlight bounds