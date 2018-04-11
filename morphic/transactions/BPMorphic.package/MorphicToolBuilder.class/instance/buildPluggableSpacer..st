widgets required
buildPluggableSpacer: spec 
	| _gsSqueakTemp_widget |
	_gsSqueakTemp_widget := self spacerClass new.
	self register: _gsSqueakTemp_widget id: spec name.
	_gsSqueakTemp_widget borderWidth: 0.
	_gsSqueakTemp_widget
		color: (spec color
				ifNil: [Color transparent]).
	_gsSqueakTemp_widget extent: spec extent.
	self buildHelpFor: _gsSqueakTemp_widget spec: spec.
	self setFrame: spec frame in: _gsSqueakTemp_widget.
	self setLayoutHintsFor: _gsSqueakTemp_widget spec: spec.
	parent
		ifNotNil: [self add: _gsSqueakTemp_widget to: parent].
	^ _gsSqueakTemp_widget