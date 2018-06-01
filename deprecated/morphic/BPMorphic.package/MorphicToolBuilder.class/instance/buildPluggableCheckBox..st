widgets optional
buildPluggableCheckBox: spec 
	| _gsSqueakTemp_widget _gsSqueakTemp_label _gsSqueakTemp_state _gsSqueakTemp_action |
	_gsSqueakTemp_label := spec label.
	_gsSqueakTemp_state := spec state.
	_gsSqueakTemp_action := spec action.
	_gsSqueakTemp_widget := self checkBoxClass
				on: spec model
				getState: (_gsSqueakTemp_state isSymbol
						ifTrue: [_gsSqueakTemp_state])
				action: (_gsSqueakTemp_action isSymbol
						ifTrue: [_gsSqueakTemp_action])
				label: (_gsSqueakTemp_label isSymbol
						ifTrue: [_gsSqueakTemp_label]).
	self register: _gsSqueakTemp_widget id: spec name.
	_gsSqueakTemp_widget installButton.
	"widget getColorSelector: spec color.
	widget offColor: Color white..
	self buildHelpFor: widget spec: spec. 
	(label isSymbol or:[label == nil]) ifFalse:[widget label: label]
	"
	self setFrame: spec frame in: _gsSqueakTemp_widget.
	self setLayoutHintsFor: _gsSqueakTemp_widget spec: spec.
	parent
		ifNotNil: [self add: _gsSqueakTemp_widget to: parent].
	^ _gsSqueakTemp_widget