widgets optional
buildPluggableDropDownList: spec 
	| _gsSqueakTemp_widget _gsSqueakTemp_model _gsSqueakTemp_listSelector _gsSqueakTemp_selectionSelector _gsSqueakTemp_selectionSetter |
	_gsSqueakTemp_model := spec model.
	_gsSqueakTemp_listSelector := spec listSelector.
	_gsSqueakTemp_selectionSelector := spec selectionSelector.
	_gsSqueakTemp_selectionSetter := spec selectionSetter.
	_gsSqueakTemp_widget := self dropDownListClass new model: _gsSqueakTemp_model;
				 listSelector: _gsSqueakTemp_listSelector;
				 selectionSelector: _gsSqueakTemp_selectionSelector;
				 selectionSetter: _gsSqueakTemp_selectionSetter;
				 yourself.
	self register: _gsSqueakTemp_widget id: spec name.
	_gsSqueakTemp_widget installDropDownList.
	self setFrame: spec frame in: _gsSqueakTemp_widget.
	self setLayoutHintsFor: _gsSqueakTemp_widget spec: spec.
	parent
		ifNotNil: [self add: _gsSqueakTemp_widget to: parent].
	^ _gsSqueakTemp_widget