private
addDirectionHandles
	| _gsSqueakTemp_centerHandle _gsSqueakTemp_d _gsSqueakTemp_w _gsSqueakTemp_directionShaft _gsSqueakTemp_patch _gsSqueakTemp_patchColor _gsSqueakTemp_crossHairColor |
	self showingDirectionHandles
		ifFalse: [^ self].
	directionArrowAnchor := (target point: target referencePosition in: self world) rounded.
	_gsSqueakTemp_patch := target
				imageFormForRectangle: (Rectangle center: directionArrowAnchor extent: 3 @ 3).
	_gsSqueakTemp_patchColor := _gsSqueakTemp_patch colorAt: 1 @ 1.
	(_gsSqueakTemp_directionShaft := LineMorph newSticky makeForwardArrow) borderWidth: 2;
		
		borderColor: (Color green orColorUnlike: _gsSqueakTemp_patchColor).
	self positionDirectionShaft: _gsSqueakTemp_directionShaft.
	self addMorphFront: _gsSqueakTemp_directionShaft.
	_gsSqueakTemp_directionShaft setCenteredBalloonText: 'Set forward direction' translated;
		
		on: #mouseDown
		send: #doDirection:with:
		to: self;
		
		on: #mouseMove
		send: #trackDirectionArrow:with:
		to: self;
		
		on: #mouseUp
		send: #setDirection:with:
		to: self.
	_gsSqueakTemp_d := 15.
	"diameter"
	_gsSqueakTemp_w := 3.
	"borderWidth"
	_gsSqueakTemp_crossHairColor := Color red orColorUnlike: _gsSqueakTemp_patchColor.
	(_gsSqueakTemp_centerHandle := EllipseMorph
				newBounds: (0 @ 0 extent: _gsSqueakTemp_d @ _gsSqueakTemp_d)
				color: Color transparent) borderWidth: _gsSqueakTemp_w;
		
		borderColor: (Color blue orColorUnlike: _gsSqueakTemp_patchColor);
		 addMorph: (LineMorph
			from: _gsSqueakTemp_d // 2 @ _gsSqueakTemp_w
			to: _gsSqueakTemp_d // 2 @ (_gsSqueakTemp_d - _gsSqueakTemp_w - 1)
			color: _gsSqueakTemp_crossHairColor
			width: 1) lock;
		 addMorph: (LineMorph
			from: _gsSqueakTemp_w @ (_gsSqueakTemp_d // 2)
			to: _gsSqueakTemp_d - _gsSqueakTemp_w - 1 @ (_gsSqueakTemp_d // 2)
			color: _gsSqueakTemp_crossHairColor
			width: 1) lock;
		 align: _gsSqueakTemp_centerHandle bounds center with: directionArrowAnchor.
	_gsSqueakTemp_centerHandle wantsYellowButtonMenu: false.
	self addMorph: _gsSqueakTemp_centerHandle.
	_gsSqueakTemp_centerHandle setCenteredBalloonText: 'Rotation center (hold down the shift key and drag from here to change it)' translated;
		
		on: #mouseDown
		send: #prepareToTrackCenterOfRotation:with:
		to: self;
		
		on: #mouseMove
		send: #trackCenterOfRotation:with:
		to: self;
		
		on: #mouseUp
		send: #setCenterOfRotation:with:
		to: self