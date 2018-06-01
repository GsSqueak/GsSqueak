private
setListPropertiesFor: widget spec: aSpec
		
	"Override default scroll bar policies if needed. Widget will use preference values otherwise."
	aSpec hScrollBarPolicy ifNotNil: [:policy |
		policy caseOf: {
			[#always] -> [widget alwaysShowHScrollBar].
			[#never] -> [widget hideHScrollBarIndefinitely].
			[#whenNeeded] -> [widget showHScrollBarOnlyWhenNeeded]. } ].
	aSpec vScrollBarPolicy ifNotNil: [:policy |
		policy caseOf: {
			[#always] -> [widget alwaysShowVScrollBar].
			[#never] -> [widget hideVScrollBarIndefinitely].
			[#whenNeeded] -> [widget showVScrollBarOnlyWhenNeeded]. } ].	
	
	widget
		getListElementSelector: aSpec listItem;
		getListSizeSelector: aSpec listSize;
		getIconSelector: aSpec icon;
		getHelpSelector: aSpec helpItem;
		doubleClickSelector: aSpec doubleClick.
	
	widget
		autoDeselect: aSpec autoDeselect;
		keystrokePreviewSelector: aSpec keystrokePreview.
	
	aSpec filterableList ifNotNil: [:b | widget filterableList: b].
	aSpec clearFilterAutomatically ifNotNil: [:b | widget clearFilterAutomatically: b].
	
	aSpec color ifNotNil: [:c | widget color: c].
	self buildHelpFor: widget spec: aSpec. 
			
	self setFrame: aSpec frame in: widget.
	self setLayoutHintsFor: widget spec: aSpec.
	
	parent ifNotNil:[self add: widget to: parent].
	(panes notNil and: [aSpec list notNil]) ifTrue: [panes add: aSpec list].
