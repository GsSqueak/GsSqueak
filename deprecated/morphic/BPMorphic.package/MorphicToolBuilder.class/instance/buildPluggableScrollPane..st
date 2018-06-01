widgets optional
buildPluggableScrollPane: spec 
	| _gsSqueakTemp_widget _gsSqueakTemp_panel |
	_gsSqueakTemp_widget := self scrollPaneClass new.
	_gsSqueakTemp_widget model: spec model.
	self register: _gsSqueakTemp_widget id: spec name.
	spec children
		ifNil: [spec morph
				ifNil: [_gsSqueakTemp_widget morphClass: spec morphClass]
				ifNotNil: [:m | _gsSqueakTemp_widget morph: m]]
		ifNotNil: [:obj | 
			"Create panel morph to scroll it."
			_gsSqueakTemp_panel := self pluggablePanelSpec new model: spec model;
						 children: obj;
						 layout: spec layout;
						
						horizontalResizing: (spec layout == #proportional
								ifTrue: [#rigid]
								ifFalse: [#shrinkWrap]);
						
						verticalResizing: (spec layout == #proportional
								ifTrue: [#rigid]
								ifFalse: [#shrinkWrap]);
						 buildWith: self.
			_gsSqueakTemp_widget morph: _gsSqueakTemp_panel].
	self setFrame: spec frame in: _gsSqueakTemp_widget.
	self setLayoutHintsFor: _gsSqueakTemp_widget spec: spec.
	parent
		ifNotNil: [self add: _gsSqueakTemp_widget to: parent].
	spec borderWidth
		ifNotNil: [:w | _gsSqueakTemp_widget borderWidth: w].
	"Override default scroll bar policies if needed. Widget will use
	preference values otherwise."
	spec hScrollBarPolicy
		ifNotNil: [:policy | policy caseOf: {
				[#always] -> [_gsSqueakTemp_widget alwaysShowHScrollBar].
				[#never] -> [_gsSqueakTemp_widget hideHScrollBarIndefinitely].
				[#whenNeeded] -> [_gsSqueakTemp_widget showHScrollBarOnlyWhenNeeded]}].
	spec vScrollBarPolicy
		ifNotNil: [:policy | policy caseOf: {
				[#always] -> [_gsSqueakTemp_widget alwaysShowVScrollBar].
				[#never] -> [_gsSqueakTemp_widget hideVScrollBarIndefinitely].
				[#whenNeeded] -> [_gsSqueakTemp_widget showVScrollBarOnlyWhenNeeded]}].
	^ _gsSqueakTemp_widget