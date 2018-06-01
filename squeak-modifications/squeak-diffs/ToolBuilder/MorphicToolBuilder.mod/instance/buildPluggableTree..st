widgets required
buildPluggableTree: aSpec
	| widget |
	widget := self treeClass new.
	self register: widget id: aSpec name.
	widget model: aSpec model.
	widget getSelectedPathSelector: aSpec getSelectedPath.
	widget setSelectedSelector: aSpec setSelected.
	widget getSelectedSelector: aSpec getSelected.
	widget setSelectedParentSelector: aSpec setSelectedParent.
	widget getChildrenSelector: aSpec getChildren.
	widget hasChildrenSelector: aSpec hasChildren.
	widget getLabelSelector: aSpec label.
	widget getIconSelector: aSpec icon.
	widget getHelpSelector: aSpec help.
	widget getMenuSelector: aSpec menu.
	widget keystrokeActionSelector: aSpec keyPress.
	widget nodeClass: aSpec nodeClass.
	widget getRootsSelector: aSpec roots.
	widget autoDeselect: aSpec autoDeselect.
	
	widget dropItemSelector: aSpec dropItem.
	widget wantsDropSelector: aSpec dropAccept.
	widget dragItemSelector: aSpec dragItem.
	widget dragStartedSelector: aSpec dragStarted.
	
	widget columns: aSpec columns.
	
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
	
	self setFrame: aSpec frame in: widget.
	self setLayoutHintsFor: widget spec: aSpec.
	
	parent ifNotNil:[self add: widget to: parent].
"	panes ifNotNil:[
		aSpec roots ifNotNil:[panes add: aSpec roots].
	].	"
	^widget