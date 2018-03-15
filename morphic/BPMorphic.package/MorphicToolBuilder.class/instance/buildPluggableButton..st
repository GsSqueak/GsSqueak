widgets required
buildPluggableButton: aSpec 
	| _gsSqueakTemp_widget _gsSqueakTemp_label _gsSqueakTemp_state _gsSqueakTemp_action _gsSqueakTemp_enabled |
	_gsSqueakTemp_label := aSpec label.
	_gsSqueakTemp_state := aSpec state.
	_gsSqueakTemp_action := aSpec action.
	_gsSqueakTemp_widget := self buttonClass
				on: aSpec model
				getState: (_gsSqueakTemp_state isSymbol
						ifTrue: [_gsSqueakTemp_state])
				action: nil
				label: (_gsSqueakTemp_label isSymbol
						ifTrue: [_gsSqueakTemp_label]).
	_gsSqueakTemp_widget style: aSpec style.
	aSpec changeLabelWhen
		ifNotNilDo: [:event | _gsSqueakTemp_widget whenChanged: event update: aSpec label].
	self register: _gsSqueakTemp_widget id: aSpec name.
	_gsSqueakTemp_enabled := aSpec enabled.
	_gsSqueakTemp_enabled isSymbol
		ifTrue: [_gsSqueakTemp_widget getEnabledSelector: _gsSqueakTemp_enabled]
		ifFalse: [_gsSqueakTemp_widget enabled: _gsSqueakTemp_enabled].
	_gsSqueakTemp_widget action: _gsSqueakTemp_action.
	aSpec color isColor
		ifTrue: [_gsSqueakTemp_widget offColor: aSpec color]
		ifFalse: [_gsSqueakTemp_widget getColorSelector: aSpec color].
	self buildHelpFor: _gsSqueakTemp_widget spec: aSpec.
	(_gsSqueakTemp_label isSymbol
			or: [_gsSqueakTemp_label == nil])
		ifFalse: [_gsSqueakTemp_widget label: _gsSqueakTemp_label].
	self setFrame: aSpec frame in: _gsSqueakTemp_widget.
	self setLayoutHintsFor: _gsSqueakTemp_widget spec: aSpec.
	parent
		ifNotNil: [self add: _gsSqueakTemp_widget to: parent].
	^ _gsSqueakTemp_widget