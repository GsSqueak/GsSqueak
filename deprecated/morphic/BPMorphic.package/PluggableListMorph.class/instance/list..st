initialization
list: listOfStrings 
	"lex doesn't think this is used any longer, but is not yet brave enough
	to remove it. It should be removed eventually"
	"Set the receiver's list as specified"
	| _gsSqueakTemp_morphList _gsSqueakTemp_h _gsSqueakTemp_index _gsSqueakTemp_converter _gsSqueakTemp_textColor _gsSqueakTemp_font _gsSqueakTemp_loc |
	self isThisEverCalled.
	scroller removeAllMorphs.
	list := listOfStrings
				ifNil: [Array new].
	list isEmpty
		ifTrue: [self setScrollDeltas.
			^ self selectedMorph: nil].
	"NOTE: we will want a quick StringMorph init message, possibly even
	combined with event install and positioning"
	_gsSqueakTemp_font
		ifNil: [_gsSqueakTemp_font := Preferences standardListFont].
	_gsSqueakTemp_converter := self valueOfProperty: #itemConversionMethod.
	_gsSqueakTemp_converter
		ifNil: [_gsSqueakTemp_converter := #asStringOrText].
	_gsSqueakTemp_textColor := self valueOfProperty: #textColor.
	_gsSqueakTemp_morphList := list
				collect: [:each | 
					| stringMorph item |
					item := each.
					item := item perform: _gsSqueakTemp_converter.
					stringMorph := item isText
								ifTrue: [StringMorph
										contents: item
										font: _gsSqueakTemp_font
										emphasis: (item emphasisAt: 1)]
								ifFalse: [StringMorph contents: item font: _gsSqueakTemp_font].
					_gsSqueakTemp_textColor
						ifNotNil: [stringMorph color: _gsSqueakTemp_textColor].
					stringMorph].
	(self valueOfProperty: #balloonTextSelectorForSubMorphs)
		ifNotNil: [:_gsSqueakTemp_aSelector | _gsSqueakTemp_morphList
				do: [:m | m balloonTextSelector: _gsSqueakTemp_aSelector]].
	self highlightSelector
		ifNotNil: [model
				perform: self highlightSelector
				with: list
				with: _gsSqueakTemp_morphList].
	"Lay items out vertically and install them in the scroller"
	_gsSqueakTemp_h := _gsSqueakTemp_morphList first height.
	"self listItemHeight"
	_gsSqueakTemp_loc := 0 @ 0.
	_gsSqueakTemp_morphList
		do: [:m | 
			m
				bounds: (_gsSqueakTemp_loc extent: 9999 @ _gsSqueakTemp_h).
			_gsSqueakTemp_loc := _gsSqueakTemp_loc + (0 @ _gsSqueakTemp_h)].
	scroller addAllMorphs: _gsSqueakTemp_morphList.
	_gsSqueakTemp_index := self getCurrentSelectionIndex.
	self
		selectedMorph: ((_gsSqueakTemp_index = 0
					or: [_gsSqueakTemp_index > _gsSqueakTemp_morphList size])
				ifFalse: [_gsSqueakTemp_morphList at: _gsSqueakTemp_index]).
	self setScrollDeltas.
	scrollBar setValue: 0.0