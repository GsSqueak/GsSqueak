start & finish
prepareToPaint: evt 
	"Figure out what the current brush, fill, etc is. Return an action to take
	every mouseMove. Set up instance variable and pens. Prep for normal
	painting is inlined here. tk 6/14/97 21:11"
	"Install the brush, color, (replace mode), and cursor."
	| _gsSqueakTemp_specialMode _gsSqueakTemp_pfPen _gsSqueakTemp_cColor _gsSqueakTemp_cNib _gsSqueakTemp_myBrush |
	_gsSqueakTemp_specialMode := self getActionFor: evt.
	_gsSqueakTemp_cColor := self getColorFor: evt.
	_gsSqueakTemp_cNib := self getNibFor: evt.
	self
		set: #brush
		for: evt
		to: (_gsSqueakTemp_myBrush := _gsSqueakTemp_cNib).
	self
		set: #paintingFormPen
		for: evt
		to: (_gsSqueakTemp_pfPen := Pen newOnForm: paintingForm).
	self
		set: #stampForm
		for: evt
		to: nil.
	"let go of stamp"
	formCanvas := paintingForm getCanvas.
	"remember to change when undo"
	formCanvas := formCanvas
				copyOrigin: self topLeft negated
				clipRect: (0 @ 0 extent: bounds extent).
	_gsSqueakTemp_specialMode == #paint:
		ifTrue: ["get it to one bit depth. For speed, instead of going through a
			colorMap every time ."
			self
				set: #brush
				for: evt
				to: (_gsSqueakTemp_myBrush := Form extent: _gsSqueakTemp_myBrush extent depth: 1).
			_gsSqueakTemp_myBrush offset: 0 @ 0 - (_gsSqueakTemp_myBrush extent // 2).
			_gsSqueakTemp_cNib displayOn: _gsSqueakTemp_myBrush at: 0 @ 0 - _gsSqueakTemp_cNib offset.
			_gsSqueakTemp_pfPen sourceForm: _gsSqueakTemp_myBrush.
			_gsSqueakTemp_pfPen combinationRule: Form paint.
			_gsSqueakTemp_pfPen color: _gsSqueakTemp_cColor.
			_gsSqueakTemp_cColor isTransparent
				ifTrue: [_gsSqueakTemp_pfPen combinationRule: Form erase1bitShape.
					_gsSqueakTemp_pfPen color: Color black].
			^ #paint:].
	_gsSqueakTemp_specialMode == #erase:
		ifTrue: [self erasePrep: evt.
			^ #erase:].
	_gsSqueakTemp_specialMode == #stamp:
		ifTrue: [self
				set: #stampForm
				for: evt
				to: palette stampForm.
			"keep it"
			^ #stamp:].
	(self respondsTo: _gsSqueakTemp_specialMode)
		ifTrue: [^ _gsSqueakTemp_specialMode"fill: areaFill: pickup: (in mouseUp:) 
			rect: ellipse: line: polygon: star:"]
		ifFalse: ["Don't recognise the command"
			palette setAction: #paint: evt: evt.
			"set it to Paint"
			^ self prepareToPaint: evt]