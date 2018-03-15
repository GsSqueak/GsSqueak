widgets required
buildPluggableText: aSpec 
	| _gsSqueakTemp_widget |
	_gsSqueakTemp_widget := self textPaneClass new.
	aSpec stylerClass
		ifNotNil: [:c | _gsSqueakTemp_widget
				styler: (c new view: _gsSqueakTemp_widget)].
	_gsSqueakTemp_widget
		on: aSpec model
		text: aSpec getText
		accept: aSpec setText
		readSelection: aSpec selection
		menu: aSpec menu.
	aSpec font
		ifNotNil: [:f | _gsSqueakTemp_widget font: f].
	_gsSqueakTemp_widget readOnly: aSpec readOnly.
	_gsSqueakTemp_widget editTextSelector: aSpec editText.
	_gsSqueakTemp_widget wantsFrameAdornments: aSpec indicateUnacceptedChanges.
	_gsSqueakTemp_widget askBeforeDiscardingEdits: aSpec askBeforeDiscardingEdits.
	_gsSqueakTemp_widget setProperty: #alwaysAccept toValue: aSpec askBeforeDiscardingEdits not.
	aSpec softLineWrap
		ifNotNil: [:b | _gsSqueakTemp_widget wrapFlag: b].
	_gsSqueakTemp_widget isAutoFit
		ifTrue: [_gsSqueakTemp_widget hideHScrollBarIndefinitely]
		ifFalse: [_gsSqueakTemp_widget showHScrollBarOnlyWhenNeeded].
	self register: _gsSqueakTemp_widget id: aSpec name.
	_gsSqueakTemp_widget getColorSelector: aSpec color.
	_gsSqueakTemp_widget getTextColorSelector: aSpec textColor.
	self buildHelpFor: _gsSqueakTemp_widget spec: aSpec.
	self setFrame: aSpec frame in: _gsSqueakTemp_widget.
	self setLayoutHintsFor: _gsSqueakTemp_widget spec: aSpec.
	parent
		ifNotNil: [self add: _gsSqueakTemp_widget to: parent].
	^ _gsSqueakTemp_widget