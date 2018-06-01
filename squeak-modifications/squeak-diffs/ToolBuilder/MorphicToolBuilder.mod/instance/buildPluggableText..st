widgets required
buildPluggableText: aSpec
	| widget |
	widget := self textPaneClass new.
	aSpec stylerClass ifNotNil: [:c | widget styler: (c new view: widget)].	
	widget
		on: aSpec model
		text: aSpec getText 
		accept: aSpec setText
		readSelection: aSpec selection 
		menu: aSpec menu.
	aSpec font ifNotNil: [:f | widget font: f].
	
	widget readOnly: aSpec readOnly.
	widget editTextSelector: aSpec editText.
	widget wantsFrameAdornments: aSpec indicateUnacceptedChanges.

	widget askBeforeDiscardingEdits: aSpec askBeforeDiscardingEdits.
	widget setProperty: #alwaysAccept toValue: aSpec askBeforeDiscardingEdits not.

	aSpec softLineWrap ifNotNil: [:b | widget wrapFlag: b].

	widget isAutoFit
		ifTrue: [widget hideHScrollBarIndefinitely]
		ifFalse: [widget showHScrollBarOnlyWhenNeeded].
	
	self register: widget id: aSpec name.
	widget getColorSelector: aSpec color.
	widget getTextColorSelector: aSpec textColor.
	self buildHelpFor: widget spec: aSpec.
	 
	self setFrame: aSpec frame in: widget.
	self setLayoutHintsFor: widget spec: aSpec.
	
	parent ifNotNil:[self add: widget to: parent].
	^widget