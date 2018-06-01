initialization
addStampsAndShapes
	| shapeTab shapes stampTab stamps |
	(stampTab := ThreePhaseButtonMorph new)
		onImage: self class stampTabImage;
		offImage: self class stampTabImage;
		pressedImage: self class stampTabImage;
		setNamePropertyTo: 'stampTab';
		actionSelector: #toggleStamps; target: self;
		position: self position + (9@image height);
		bounds: (stampTab position extent: stampTab onImage extent).
	self addMorph: stampTab.
	
	(shapeTab := ThreePhaseButtonMorph new)
		onImage: self class shapeTabImage;
		offImage: self class shapeTabImage;
		pressedImage: self class shapeTabImage;
		setNamePropertyTo: 'shapeTab';
		actionSelector: #toggleShapes; target: self;
		position: self position + (image width - shapeTab onImage width-9@image height);
		bounds: (shapeTab position extent: shapeTab onImage extent).
	self addMorph: shapeTab.
	
	self layoutChanged.
	
	(stamps := self class stampsImage asMorph)
		setNamePropertyTo: 'stamps';
		visible: false;
		position: self position + (0@(image height - stamps image height)).
	self addMorph: stamps.
	
	(shapes := self class shapesImage asMorph)
		setNamePropertyTo: 'shapes';
		visible: false;
		position: self position + (image width - shapes image width@image height).
	self addMorph: shapes.