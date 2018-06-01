initialization
addStampsAndShapes
	| _gsSqueakTemp_shapeTab _gsSqueakTemp_shapes _gsSqueakTemp_stampTab _gsSqueakTemp_stamps |
	(_gsSqueakTemp_stampTab := ThreePhaseButtonMorph new) onImage: self class stampTabImage;
		 offImage: self class stampTabImage;
		 pressedImage: self class stampTabImage;
		 setNamePropertyTo: 'stampTab';
		 actionSelector: #toggleStamps;
		 target: self;
		 position: self position + (9 @ image height);
		
		bounds: (_gsSqueakTemp_stampTab position extent: _gsSqueakTemp_stampTab onImage extent).
	self addMorph: _gsSqueakTemp_stampTab.
	(_gsSqueakTemp_shapeTab := ThreePhaseButtonMorph new) onImage: self class shapeTabImage;
		 offImage: self class shapeTabImage;
		 pressedImage: self class shapeTabImage;
		 setNamePropertyTo: 'shapeTab';
		 actionSelector: #toggleShapes;
		 target: self;
		 position: self position + (image width - _gsSqueakTemp_shapeTab onImage width - 9 @ image height);
		
		bounds: (_gsSqueakTemp_shapeTab position extent: _gsSqueakTemp_shapeTab onImage extent).
	self addMorph: _gsSqueakTemp_shapeTab.
	self layoutChanged.
	(_gsSqueakTemp_stamps := self class stampsImage asMorph) setNamePropertyTo: 'stamps';
		 visible: false;
		 position: self position + (0 @ (image height - _gsSqueakTemp_stamps image height)).
	self addMorph: _gsSqueakTemp_stamps.
	(_gsSqueakTemp_shapes := self class shapesImage asMorph) setNamePropertyTo: 'shapes';
		 visible: false;
		 position: self position + (image width - _gsSqueakTemp_shapes image width @ image height).
	self addMorph: _gsSqueakTemp_shapes