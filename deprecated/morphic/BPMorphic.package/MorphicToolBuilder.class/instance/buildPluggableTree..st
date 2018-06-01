widgets required
buildPluggableTree: aSpec 
	| _gsSqueakTemp_widget |
	_gsSqueakTemp_widget := self treeClass new.
	self register: _gsSqueakTemp_widget id: aSpec name.
	_gsSqueakTemp_widget model: aSpec model.
	_gsSqueakTemp_widget getSelectedPathSelector: aSpec getSelectedPath.
	_gsSqueakTemp_widget setSelectedSelector: aSpec setSelected.
	_gsSqueakTemp_widget getSelectedSelector: aSpec getSelected.
	_gsSqueakTemp_widget setSelectedParentSelector: aSpec setSelectedParent.
	_gsSqueakTemp_widget getChildrenSelector: aSpec getChildren.
	_gsSqueakTemp_widget hasChildrenSelector: aSpec hasChildren.
	_gsSqueakTemp_widget getLabelSelector: aSpec label.
	_gsSqueakTemp_widget getIconSelector: aSpec icon.
	_gsSqueakTemp_widget getHelpSelector: aSpec help.
	_gsSqueakTemp_widget getMenuSelector: aSpec menu.
	_gsSqueakTemp_widget keystrokeActionSelector: aSpec keyPress.
	_gsSqueakTemp_widget nodeClass: aSpec nodeClass.
	_gsSqueakTemp_widget getRootsSelector: aSpec roots.
	_gsSqueakTemp_widget autoDeselect: aSpec autoDeselect.
	_gsSqueakTemp_widget dropItemSelector: aSpec dropItem.
	_gsSqueakTemp_widget wantsDropSelector: aSpec dropAccept.
	_gsSqueakTemp_widget dragItemSelector: aSpec dragItem.
	_gsSqueakTemp_widget dragStartedSelector: aSpec dragStarted.
	_gsSqueakTemp_widget columns: aSpec columns.
	"Override default scroll bar policies if needed. Widget will use
	preference values otherwise."
	aSpec hScrollBarPolicy
		ifNotNil: [:policy | policy caseOf: {
				[#always] -> [_gsSqueakTemp_widget alwaysShowHScrollBar].
				[#never] -> [_gsSqueakTemp_widget hideHScrollBarIndefinitely].
				[#whenNeeded] -> [_gsSqueakTemp_widget showHScrollBarOnlyWhenNeeded]}].
	aSpec vScrollBarPolicy
		ifNotNil: [:policy | policy caseOf: {
				[#always] -> [_gsSqueakTemp_widget alwaysShowVScrollBar].
				[#never] -> [_gsSqueakTemp_widget hideVScrollBarIndefinitely].
				[#whenNeeded] -> [_gsSqueakTemp_widget showVScrollBarOnlyWhenNeeded]}].
	self setFrame: aSpec frame in: _gsSqueakTemp_widget.
	self setLayoutHintsFor: _gsSqueakTemp_widget spec: aSpec.
	parent
		ifNotNil: [self add: _gsSqueakTemp_widget to: parent].
	"panes ifNotNil:[
	aSpec roots ifNotNil:[panes add: aSpec roots].
	].	"
	^ _gsSqueakTemp_widget