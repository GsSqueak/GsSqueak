construction
addTitle: aString icon: aForm updatingSelector: aSelector updateTarget: aTarget 
	"Add a title line at the top of this menu Make aString its initial
	contents. If aSelector is not nil, then periodically obtain fresh values
	for its contents by sending aSelector to aTarget."
	| _gsSqueakTemp_container _gsSqueakTemp_fontToUse _gsSqueakTemp_colorToUse _gsSqueakTemp_labelArea |
	_gsSqueakTemp_container := AlignmentMorph newRow.
	self setTitleParametersFor: _gsSqueakTemp_container.
	aForm
		ifNotNil: [:form | _gsSqueakTemp_container addMorphBack: form asMorph].
	_gsSqueakTemp_fontToUse := self userInterfaceTheme titleFont
				ifNil: [TextStyle defaultFont].
	_gsSqueakTemp_colorToUse := self userInterfaceTheme titleTextColor
				ifNil: [Color black].
	"Build the label."
	aSelector
		ifNil: [_gsSqueakTemp_labelArea := AlignmentMorph newColumn color: Color transparent;
						 vResizing: #shrinkWrap;
						 wrapCentering: #center;
						 cellPositioning: #topCenter.
			aString asString
				linesDo: [:line | _gsSqueakTemp_labelArea addMorphBack: ((StringMorph contents: line font: _gsSqueakTemp_fontToUse) color: _gsSqueakTemp_colorToUse;
							 yourself)]]
		ifNotNil: [_gsSqueakTemp_labelArea := UpdatingStringMorph on: aTarget selector: aSelector.
			_gsSqueakTemp_labelArea font: _gsSqueakTemp_fontToUse.
			_gsSqueakTemp_labelArea color: _gsSqueakTemp_colorToUse.
			_gsSqueakTemp_labelArea useStringFormat.
			_gsSqueakTemp_labelArea lock].
	_gsSqueakTemp_container addMorphBack: _gsSqueakTemp_labelArea.
	""
	_gsSqueakTemp_container setProperty: #titleString toValue: aString.
	self addMorphFront: _gsSqueakTemp_container.
	""
	(self hasProperty: #needsTitlebarWidgets)
		ifTrue: [self addStayUpIcons]