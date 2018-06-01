construction
addStayUpIcons
	| _gsSqueakTemp_title _gsSqueakTemp_closeBox _gsSqueakTemp_pinBox |
	_gsSqueakTemp_title := submorphs
				detect: [:ea | ea hasProperty: #titleString]
				ifNone: ["Called too soon. Will add stay-up icons when title is
					added. "
					self setProperty: #needsTitlebarWidgets toValue: true.
					^ self].
	_gsSqueakTemp_closeBox := SystemWindowButton new target: self;
				 actionSelector: #delete;
				 labelGraphic: self class closeBoxImage;
				 color: Color transparent;
				 extent: self class closeBoxImage extent;
				 borderWidth: 0.
	_gsSqueakTemp_pinBox := SystemWindowButton new target: self;
				 actionSelector: #stayUp:;
				 arguments: {true};
				 labelGraphic: self class pushPinImage;
				 color: Color transparent;
				 extent: self class pushPinImage extent;
				 borderWidth: 0.
	Preferences noviceMode
		ifTrue: [_gsSqueakTemp_closeBox setBalloonText: 'close this menu'.
			_gsSqueakTemp_pinBox setBalloonText: 'keep this menu up'].
	_gsSqueakTemp_title addMorphFront: _gsSqueakTemp_closeBox;
		 addMorphBack: _gsSqueakTemp_pinBox.
	self setProperty: #hasTitlebarWidgets toValue: true.
	self removeProperty: #needsTitlebarWidgets.
	self removeStayUpItems