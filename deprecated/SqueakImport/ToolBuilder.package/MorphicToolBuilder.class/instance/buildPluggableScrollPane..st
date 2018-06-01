widgets optional
buildPluggableScrollPane: spec

	| widget panel |
	widget := self scrollPaneClass new.
	widget model: spec model.
	self register: widget id: spec name.
	
	spec children
		ifNotNil: [:obj |
			"Create panel morph to scroll it."
			panel := self pluggablePanelSpec new
				model: spec model;
				children: obj;
				layout: spec layout;
				horizontalResizing: (spec layout == #proportional ifTrue: [#rigid] ifFalse: [#shrinkWrap]);
				verticalResizing: (spec layout == #proportional ifTrue: [#rigid] ifFalse: [#shrinkWrap]);
				buildWith: self.
			widget morph: panel.
			]
		ifNil: [spec morph
			ifNotNil: [:m | widget morph: m]
			ifNil: [widget morphClass: spec morphClass]].
	
	self setFrame: spec frame in: widget.
	self setLayoutHintsFor: widget spec: spec.
	
	parent ifNotNil: [self add: widget to: parent].
	
	spec borderWidth ifNotNil: [:w | widget borderWidth: w].
	
	"Override default scroll bar policies if needed. Widget will use preference values otherwise."
	spec hScrollBarPolicy ifNotNil: [:policy |
		policy caseOf: {
			[#always] -> [widget alwaysShowHScrollBar].
			[#never] -> [widget hideHScrollBarIndefinitely].
			[#whenNeeded] -> [widget showHScrollBarOnlyWhenNeeded]}].
	spec vScrollBarPolicy ifNotNil: [:policy | 
		policy caseOf: {
			[#always] -> [widget alwaysShowVScrollBar].
			[#never] -> [widget hideVScrollBarIndefinitely].
			[#whenNeeded] -> [widget showVScrollBarOnlyWhenNeeded]}].
	
	^ widget